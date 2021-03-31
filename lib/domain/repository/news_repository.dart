import 'package:flutter/foundation.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';

abstract class NewsRepository {
  Future<SourceResposeModel> getSources();

  Future<ArticleResponseModel> getTopHeadLines();

  Future<ArticleResponseModel> search({@required String value});

  Future<ArticleResponseModel> getHotNews();

  Future<ArticleResponseModel> getSourcesNews(@required String sourceId);
}
