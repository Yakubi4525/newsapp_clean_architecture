import 'package:news_cleaan_arch_bloc/domain/model/article.dart';

class ArticleResponseModel {
  final List<ArticleModel> articles;
  final String error;

  ArticleResponseModel(this.articles, this.error);

}
