import 'package:hive/hive.dart';
import 'package:news_cleaan_arch_bloc/data/local/model/article_local_model.dart';
import 'package:news_cleaan_arch_bloc/data/mapper/to_local_article.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article.dart';

class LocalArticleSevice {
  static const _BOX_NAME = 'artList';

  Future<void> saveArticleModel(ArticleModel model) async {
    final articleBox = await Hive.openBox<LocalArticleModel>(_BOX_NAME);
    var article = LocalArticleMapper.fromLocal(model);
    articleBox.put('${article.url}', article);
    print('ADDED');
  }

  Future<void> removeArticleModel(String url) async {
    final articleBox = await Hive.openBox<LocalArticleModel>(_BOX_NAME);
    articleBox.delete(url);
  }

  Future<List<LocalArticleModel>> getLocalArticles() async {
    List<LocalArticleModel> articles =
        List<LocalArticleModel>.empty(growable: true);
    try {
      final articleBox = await Hive.openBox<LocalArticleModel>(_BOX_NAME);

      if (articleBox.length > 0) {
        for (int i = 0; i < articleBox.length; i++) {
          var article = articleBox.getAt(i);
          articles.add(article);
        }
      }
    } catch (error) {
      print(error);
      rethrow;
    }
    return articles;
  }
}
