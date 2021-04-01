import 'package:news_cleaan_arch_bloc/data/api/api_util.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';

class NewsDataRepository extends NewsRepository {
  final ApiUtil _apiUtil;
  NewsDataRepository(this._apiUtil);

  @override
  Future<ArticleResponseModel> getHotNews() {
    try {
      return _apiUtil.getHotNews();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<SourceResposeModel> getSources() {
    try {
      return _apiUtil.getSource();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ArticleResponseModel> getSourcesNews(String sourceId) {
    try {
      return _apiUtil.getSourceNews(value: sourceId);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ArticleResponseModel> getTopHeadLines() {
    try {
      return _apiUtil.getTopHeadLines();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<ArticleResponseModel> search({String value}) {
    try {
      return _apiUtil.search(value: value);
    } catch (errorr) {
      rethrow;
    }
  }
}
