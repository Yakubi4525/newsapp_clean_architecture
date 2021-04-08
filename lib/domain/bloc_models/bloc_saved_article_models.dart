
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';

class SavedModelInitState extends ArticleResponseModel {}

class SavedModelLoadingState extends ArticleResponseModel {}

class SavedModelerrorState extends ArticleResponseModel {
  String error;
  SavedModelerrorState({this.error});
}

class SavedModelOkState extends ArticleResponseModel {
  SavedModelOkState({ArticleResponseModel model})
      : super(articles: model.articles);
}
