import 'package:news_cleaan_arch_bloc/data/api/model/api_article_response.dart';
import 'package:news_cleaan_arch_bloc/data/api/model/api_sources_response.dart';
import 'package:news_cleaan_arch_bloc/data/mapper/to_article.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';

class ArticleResponseModelMapper {
  static fromApi(ApiArticleResponseModel apiArticleResponseModel) {
    if (apiArticleResponseModel.articles == null)
      return ArticleResponseModel(
          articles: null);
    return ArticleResponseModel(
        articles: apiArticleResponseModel.articles
            .map((e) => ArticleMapper.fromApi(e)));
  }
}
