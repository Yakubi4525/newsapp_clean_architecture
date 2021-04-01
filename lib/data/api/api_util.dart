import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/get_hot_news_body.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/get_source_body.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/get_source_news_body.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/get_top_head_line_body.dart';
import 'package:news_cleaan_arch_bloc/data/api/request/search_body.dart';
import 'package:news_cleaan_arch_bloc/data/api/service/news_service.dart';
import 'package:news_cleaan_arch_bloc/data/mapper/to_article_response.dart';
import 'package:news_cleaan_arch_bloc/data/mapper/to_source_response.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';

class ApiUtil {
  final NewsService _newsService;

  ApiUtil(this._newsService);

  Future<SourceResposeModel> getSource() async {
    final body = GetSourceBody();
    var result;
    try {
      result = await _newsService.getSource(body);
    } catch (error) {
      rethrow;
    }
    return SourceResponseModelMapper.fromApi(result);
  }


  Future<ArticleResponseModel> getTopHeadLines() async {
    final body = GetTopHeadLinesBody();
    var result;
    try {
      result = await _newsService.getTopHeadLines(body);
    } catch (error) {
      rethrow;
    }
    return ArticleResponseModelMapper.fromApi(result);
  }


  Future<ArticleResponseModel> search({@required String value}) async {
    final body = SearchBody(value: value);
    var result;
    try {
      result = await _newsService.search(body);
    } catch (error) {
      rethrow;
    }
    return ArticleResponseModelMapper.fromApi(result);
  }


  Future<ArticleResponseModel> getHotNews() async {
    final body = GetHotNewsBody();
    var result;
    try {
      result = await _newsService.getHotNews(body);
    } catch (error) {
      rethrow;
    }
    return ArticleResponseModelMapper.fromApi(result);
  }


  Future<ArticleResponseModel> getSourceNews({@required String value}) async {
    final body = GetSourceNewsBody(sourceId: value);
    var result;
    try {
      result = await _newsService.getSourceNews(body);
    } catch (error) {
      rethrow;
    }
    return ArticleResponseModelMapper.fromApi(result);
  }
}
