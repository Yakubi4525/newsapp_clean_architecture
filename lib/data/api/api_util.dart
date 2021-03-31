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
    final result = await _newsService.getSource(body);
    return SourceResponseModelMapper.fromApi(result);
  }

  Future<ArticleResponseModel> getTopHeadLines() async {
    final body = GetTopHeadLinesBody();
    final result = await _newsService.getTopHeadLines(body);
    return ArticleResponseModelMapper.fromApi(result);
  }

  Future<ArticleResponseModel> search({@required String value}) async {
    final body = SearchBody(value: value);
    final result = await _newsService.search(body);
    return ArticleResponseModelMapper.fromApi(result);
  }

  Future<ArticleResponseModel> getHotNews() async {
    final body = GetHotNewsBody();
    final result = await _newsService.getHotNews(body);
    return ArticleResponseModelMapper.fromApi(result);
  }

  Future<ArticleResponseModel> getSourceNews({@required String value}) async {
    final body = GetSourceNewsBody(sourceId: value);
    final result = await _newsService.getSourceNews(body);
    return ArticleResponseModelMapper.fromApi(result);
  }
}
