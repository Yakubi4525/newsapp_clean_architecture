import 'package:news_cleaan_arch_bloc/data/api/api_util.dart';
import 'package:news_cleaan_arch_bloc/data/local/service/article_local_service.dart';
import 'package:news_cleaan_arch_bloc/data/mapper/to_article.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';

class NewsDataRepository extends NewsRepository {
  final ApiUtil _apiUtil;
  final LocalArticleSevice _localArticleSevice;
  NewsDataRepository(this._apiUtil, this._localArticleSevice);

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
  Future<ArticleResponseModel> getSourcesNews({String sourceId}) {
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

  @override
  Future<ArticleResponseModel> getArticleFromLocal() async {
    try {
      final result = await _localArticleSevice.getLocalArticles();
      final resp = result.map((e) => ArticleMapper.fromLocal(e)).toList();
      return ArticleResponseModel(articles: resp);
    } catch (errorr) {
      rethrow;
    }
  }
}
