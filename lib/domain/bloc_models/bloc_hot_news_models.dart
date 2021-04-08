import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';

class HotNewsModelIntnState extends ArticleResponseModel {}

class HotNewsModelLoadingState extends ArticleResponseModel {}

class HotNewsModelErrorState extends ArticleResponseModel {
  String error;
  HotNewsModelErrorState({this.error});
}

class HotNewsModelOkState extends ArticleResponseModel {
  HotNewsModelOkState({ArticleResponseModel model})
      : super(articles: model.articles);
}
