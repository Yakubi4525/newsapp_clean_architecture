import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_sources_models.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_sources_bloc.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/sources_bloc_module.dart';
import 'package:news_cleaan_arch_bloc/presentation/widgets/search_widgets/loader.dart';
import 'package:news_cleaan_arch_bloc/presentation/screens/source_detail.dart';


class SourcesScreen extends StatefulWidget {
  @override
  _SourcesScreenState createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
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
      builder:
          (BuildContext context, AsyncSnapshot<SourceResposeModel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data is SourcesModelInitialState) {
            return Container();
          } else if (snapshot.data is SourcesModelLoadingState) {
            return buildLoadingWidget();
          } else if (snapshot.data is SourcsesModelOkState) {
            return _buildSourcesWidget(snapshot.data);
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

  Widget _buildSourcesWidget(SourceResposeModel data) {
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
      return GridView.builder(
          itemCount: sources.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.86),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
              child: GestureDetector(
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SourceDetail(
                                  source: sources[index],
                                )));
                },
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[100],
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          1.0,
                          1.0,
                        ),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: sources[index].id,
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/logos/${sources[index].id}.png"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                        child: Text(
                          sources[index].name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}
