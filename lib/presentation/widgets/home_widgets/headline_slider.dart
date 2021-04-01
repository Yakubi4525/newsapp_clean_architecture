import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_top_head_models.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_top_headlines_bloc.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/top_head_line_module.dart';
import 'package:news_cleaan_arch_bloc/presentation/widgets/search_widgets/loader.dart';
import 'package:timeago/timeago.dart' as timeago;

class HeadingSliderWidget extends StatefulWidget {
  @override
  _HeadingSliderWidgetState createState() => _HeadingSliderWidgetState();
}

class _HeadingSliderWidgetState extends State<HeadingSliderWidget> {
  GetTopHeadlinesBloc _getTopHeadlinesBloc;
  @override
  void initState() {
    _getTopHeadlinesBloc = TopHaedLineModule.getBloc();
    _getTopHeadlinesBloc.loadTopHeadLinesModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _getTopHeadlinesBloc.subject.stream,
        builder: (BuildContext context,
            AsyncSnapshot<ArticleResponseModel> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data is TopHeadModelInintState) {
              return Container();
            } else if (snapshot.data is TopHeadModelLoadingState) {
              return buildLoadingWidget();
            } else if (snapshot.data is TopHeadModelOkState) {
              return _buildHeadLineSliderWidget(snapshot.data);
            } else if (snapshot.data is TopHeadModelErrorState) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
          }
          return Container();
        });
  }

  Widget _buildHeadLineSliderWidget(ArticleResponseModel data) {
    List<ArticleModel> articles = data.articles;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
            enlargeCenterPage: false, height: 200, viewportFraction: 0.9),
        items: getExpenseSliders(articles),
      ),
    );
  }

  getExpenseSliders(List<ArticleModel> articles) {
    return articles
        .map((article) => GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DetailNews(
                //               article: article,
                //             )));
              },
              child: Container(
                padding: const EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: article.img == null
                                ? AssetImage("assets/img/placeholder.jpg")
                                : NetworkImage(article.img)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [
                              0.1,
                              0.9
                            ],
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.white.withOpacity(0.0)
                            ]),
                      ),
                    ),
                    Positioned(
                        bottom: 30.0,
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          width: 250.0,
                          child: Column(
                            children: <Widget>[
                              Text(
                                article.title,
                                style: TextStyle(
                                    height: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        child: Text(
                          article.source.name,
                          style:
                              TextStyle(color: Colors.white54, fontSize: 9.0),
                        )),
                    Positioned(
                        bottom: 10.0,
                        right: 10.0,
                        child: Text(
                          timeUntil(DateTime.parse(article.date)),
                          style:
                              TextStyle(color: Colors.white54, fontSize: 9.0),
                        )),
                  ],
                ),
              ),
            ))
        .toList();
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
