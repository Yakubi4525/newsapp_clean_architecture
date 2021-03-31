import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';

class SearchModelInitState extends ArticleResponseModel {}

class SearchModelLoadingState extends ArticleResponseModel {}

class SearchModelErrorState extends ArticleResponseModel {
  String error;
  SearchModelErrorState({this.error});
}

class SearchModelOKState extends ArticleResponseModel {
  SearchModelOKState({ArticleResponseModel model})
      : super(articles: model.articles);
}
