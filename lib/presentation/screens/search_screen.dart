import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_search_models.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_search_bloc.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/search_bloc_module.dart';
import 'package:news_cleaan_arch_bloc/presentation/styles/theme.dart' as Style;
import 'package:news_cleaan_arch_bloc/presentation/widgets/search_widgets/loader.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  GetSearchBloc _getSearchBloc;
  Timer _debunce;

  @override
  void initState() {
    _getSearchBloc = SearchBlocModule.getBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
          child: TextFormField(
            style: TextStyle(fontSize: 14.0, color: Colors.black),
            controller: _searchController,
            onChanged: (changed) {
              if (_debunce != null && _debunce.isActive ?? false)
                _debunce.cancel();
              _debunce = Timer(Duration(milliseconds: 700), () {
                _getSearchBloc.loadSearchModel(changed);
              });
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: Colors.grey[100],
              suffixIcon: _searchController.text.length > 0
                  ? IconButton(
                      icon: Icon(
                        EvaIcons.backspaceOutline,
                        color: Colors.grey[500],
                        size: 16.0,
                      ),
                      onPressed: () {
                        setState(() {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _searchController.clear();
                          _getSearchBloc.loadSearchModel(
                              _searchController.text);
                        });
                      })
                  : Icon(
                      EvaIcons.searchOutline,
                      color: Colors.grey[500],
                      size: 16.0,
                    ),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      new BorderSide(color: Colors.grey[100].withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(30.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      new BorderSide(color: Colors.grey[100].withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(30.0)),
              contentPadding: EdgeInsets.only(left: 15.0, right: 10.0),
              labelText: "Search...",
              hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Style.Colors.grey,
                  fontWeight: FontWeight.w500),
              labelStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            autocorrect: false,
          ),
        ),
        Expanded(
          child: StreamBuilder(
            stream: _getSearchBloc.subject,
            initialData: _getSearchBloc.defaultitem,
            builder: (BuildContext context,
                AsyncSnapshot<ArticleResponseModel> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data is SearchModelInitState)
                  return Container();
                else if (snapshot.data is SearchModelLoadingState)
                  return buildLoadingWidget();
                else if (snapshot.data is SearchModelOKState) {
                  return _buildSourceNewsWidget(snapshot.data);
                } else if (snapshot.data is SearchModelErrorState) {
                  return Center(
                    child: Text(snapshot.error),
                  );
                }
              }
              return Container();
            },
          ),
        )
      ],
    );
  }

  Widget _buildSourceNewsWidget(ArticleResponseModel data) {
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
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DetailNews(
                //               article: articles[index],
                //             )));
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            height: MediaQuery.of(context).size.height * 1 / 3))
                  ],
                ),
              ),
            );
          });
  }

  String timeUntil(DateTime date) {
    return timeago.format(date, allowFromNow: true, locale: 'en');
  }
}
