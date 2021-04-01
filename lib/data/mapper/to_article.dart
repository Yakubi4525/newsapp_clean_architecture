import 'package:news_cleaan_arch_bloc/data/api/model/api_article.dart';
import 'package:news_cleaan_arch_bloc/data/mapper/to_source.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article.dart';

class ArticleMapper {
  static ArticleModel fromApi(ApiArticleModel apiArticleModel) {
    if (apiArticleModel.hasError == true) return ArticleModel();
    return ArticleModel(
        source: SourceMapper.fromApi(apiArticleModel.source),
        author: apiArticleModel.author,
        title: apiArticleModel.title,
        description: apiArticleModel.description,
        url: apiArticleModel.url,
        img: apiArticleModel.img,
        date: apiArticleModel.date,
        content: apiArticleModel.content);
  }
}
