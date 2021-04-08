import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_sources_models.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_sources_bloc.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/sources_bloc_module.dart';
import 'package:news_cleaan_arch_bloc/presentation/styles/theme.dart' as Style;
import 'package:news_cleaan_arch_bloc/presentation/widgets/search_widgets/loader.dart';
import 'package:news_cleaan_arch_bloc/presentation/screens/source_detail.dart';


class TopChannelWidget extends StatefulWidget {
  @override
  _TopChannelWidgetState createState() => _TopChannelWidgetState();
}

class _TopChannelWidgetState extends State<TopChannelWidget> {
  GetSourcesBloc _getSourcesBloc;

  @override
  void initState() {
    _getSourcesBloc = SourcesModule.getBloc();
    _getSourcesBloc.loadSourcesBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _getSourcesBloc.subject.stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data is SourcesModelInitialState) {
            return Container();
          } else if (snapshot.data is SourcesModelLoadingState) {
            return buildLoadingWidget();
          } else if (snapshot.data is SourcsesModelOkState) {
            return __buildSourcesWidget(snapshot.data);
          } else if (snapshot.data is SourcesModelErrorState) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        }
        return Container();
      },
    );
  }

  Widget __buildSourcesWidget(SourceResposeModel data) {
    List<SourceModel> sources = data.sources;
    if (sources.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Sources",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 115.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sources.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(top: 10.0, right: 0.0),
              width: 80.0,
              child: GestureDetector(
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SourceDetail(
                                  source: sources[index],
                                )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Hero(
                      tag: sources[index].id,
                      child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                offset: Offset(
                                  1.0,
                                  1.0,
                                ),
                              )
                            ],
                            image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/logos/${sources[index].id}.png")),
                          )),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      sources[index].name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.4,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      sources[index].category,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.4,
                          color: Style.Colors.titleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 9.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
