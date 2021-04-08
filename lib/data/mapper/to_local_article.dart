import 'package:news_cleaan_arch_bloc/data/local/model/article_local_model.dart';
import 'package:news_cleaan_arch_bloc/data/mapper/to_local_source.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article.dart';

class LocalArticleMapper {
  static LocalArticleModel fromLocal(ArticleModel articleModel) {
    if (articleModel == null) return null;
    return LocalArticleModel(
        source: LocalSourceMapper.toLocal(articleModel.source),
        author: articleModel.author,
        title: articleModel.title,
        description: articleModel.description,
        url: articleModel.url,
        img: articleModel.img,
        date: articleModel.date,
        content: articleModel.content);
  }
}
