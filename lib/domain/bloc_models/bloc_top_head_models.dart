import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';

class TopHeadModelInintState extends ArticleResponseModel {}

class TopHeadModelLoadingState extends ArticleResponseModel {}

class TopHeadModelErrorState extends ArticleResponseModel {
  String error;
  TopHeadModelErrorState({this.error});
}

class TopHeadModelOkState extends ArticleResponseModel {
  TopHeadModelOkState({ArticleResponseModel model})
      : super(articles: model.articles);
}
