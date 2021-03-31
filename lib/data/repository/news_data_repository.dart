
import 'package:news_cleaan_arch_bloc/data/api/api_util.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';

class NewsDataRepository extends NewsRepository {
  final ApiUtil _apiUtil;

  NewsDataRepository(this._apiUtil);

  @override
  Future<ArticleResponseModel> getHotNews() {
    return _apiUtil.getHotNews();
  }

  @override
  Future<SourceResposeModel> getSources() {
    return _apiUtil.getSource();
  }

  @override
  Future<ArticleResponseModel> getSourcesNews(String sourceId) {
    return _apiUtil.getSourceNews(value: sourceId);
  }

  @override
  Future<ArticleResponseModel> getTopHeadLines() {
    return _apiUtil.getTopHeadLines();
  }

  @override
  Future<ArticleResponseModel> search({String value}) {
    return _apiUtil.search(value: value);
  }
}
