import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';

class SourceNewsModelInitState extends ArticleResponseModel {}

class SourceNewsModelLoadingState extends ArticleResponseModel {}

class SourceNewsModelErrorState extends ArticleResponseModel {
  String error;
  SourceNewsModelErrorState({this.error});
}

class SourceNewsModelOkState extends ArticleResponseModel {
  SourceNewsModelOkState({ArticleResponseModel model})
      : super(articles: model.articles);
}
