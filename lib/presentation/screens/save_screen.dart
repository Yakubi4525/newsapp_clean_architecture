import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_saved_article_models.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_saved_bloc.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/local_module.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/saved_bloc_module.dart';
import 'package:news_cleaan_arch_bloc/presentation/widgets/search_widgets/loader.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'news_detail.dart';

class SaveScreen extends StatefulWidget {
  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  GetSavedBloc _getSavedBloc;
  @override
  void initState() {
    _getSavedBloc = SavedBlocModule.getBloc();
    _getSavedBloc.loadSavedModel();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _getSavedBloc.subject,
        initialData: _getSavedBloc.defaultitem,
        builder: (BuildContext context,
            AsyncSnapshot<ArticleResponseModel> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data is SavedModelInitState) {
              return Container();
            } else {
              if (snapshot.data is SavedModelLoadingState) {
                return buildLoadingWidget();
              } else {
                if (snapshot.data is SavedModelOkState) {
                  return _buildSavedWidget(snapshot.data);
                } else if (snapshot.data is SavedModelInitState) {
                  return Center(
                    child: Text(snapshot.error),
                  );
                }
              }
            }
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildSavedWidget(ArticleResponseModel data) {
    List<ArticleModel> articles = data.articles;
    if (articles.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "No more news",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      );
    } else
      return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_forever, color: Colors.white),
                    Text(
                      'DELETE',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete_forever, color: Colors.white),
                    Text(
                      'DELETE',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              key: ValueKey<ArticleModel>(articles[index]),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  var localModule = LocalModule.getApiUtil();
                  localModule.removeArticleModel(articles[index].url);
                  articles.removeAt(index);
                });
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailNews(
                                article: articles[index],
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey[200], width: 1.0),
                    ),
                    color: Colors.white,
                  ),
                  height: 150,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
                        width: MediaQuery.of(context).size.width * 3 / 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(articles[index].title,
                                maxLines: 3,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14.0)),
                            Expanded(
                                child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                          timeUntil(DateTime.parse(
                                              articles[index].date)),
                                          style: TextStyle(
                                              color: Colors.black26,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.0))
                                    ],
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 10.0),
                          width: MediaQuery.of(context).size.width * 2 / 5,
                          height: 130,
                          child: FadeInImage.assetNetwork(
                              alignment: Alignment.topCenter,
                              placeholder: 'assets/img/placeholder.jpg',
                              image: articles[index].img == null
                                  ? "http://to-let.com.bd/operator/images/noimage.png"
                                  : articles[index].img,
                              fit: BoxFit.fitHeight,
                              width: double.maxFinite,
                              height:
                                  MediaQuery.of(context).size.height * 1 / 3))
                    ],
                  ),
                ),
              ),
            );
          });
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
