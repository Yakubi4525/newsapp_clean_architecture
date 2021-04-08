import 'package:news_cleaan_arch_bloc/data/api/model/api_article.dart';
import 'package:news_cleaan_arch_bloc/data/local/model/article_local_model.dart';
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
  static ArticleModel fromLocal(LocalArticleModel localArticleModel) {
    if (localArticleModel == null) return null;
    return ArticleModel(
        source: SourceMapper.fromLocal(localArticleModel.source),
        author: localArticleModel.author,
        title: localArticleModel.title,
        description: localArticleModel.description,
        url: localArticleModel.url,
        img: localArticleModel.img,
        date: localArticleModel.date,
        content: localArticleModel.content);
  }
}
