import 'package:news_cleaan_arch_bloc/data/api/model/api_article_response.dart';
import 'package:news_cleaan_arch_bloc/data/local/model/article_response_local.dart';
import 'package:news_cleaan_arch_bloc/data/mapper/to_article.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';

class ArticleResponseModelMapper {
  static ArticleResponseModel fromApi(ApiArticleResponseModel apiArticleResponseModel) {
    if (apiArticleResponseModel.articles == null)
      return ArticleResponseModel(articles: []);
    return ArticleResponseModel(
        articles: apiArticleResponseModel.articles
            .map((e) => ArticleMapper.fromApi(e))
            .toList());
  }
   static ArticleResponseModel fromLocal(LocalArticleResponseModel localArticleResponseModel) {
    if (localArticleResponseModel.articles == null)
      return ArticleResponseModel(articles: []);
    return ArticleResponseModel(
        articles: localArticleResponseModel.articles
            .map((e) => ArticleMapper.fromLocal(e))
            .toList());
  }
}
