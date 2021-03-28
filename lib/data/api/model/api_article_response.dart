import 'api_article.dart';

class ApiArticleResponseModel {
  List<ApiArticleModel> articles;
  String error;

  ApiArticleResponseModel(this.articles, this.error);

  ApiArticleResponseModel.fromJson(Map<String, dynamic> json) {
    try {
      articles = (json["articles"] as List)
          .map((i) => new ApiArticleModel.fromJson(i))
          .toList();
      error = "";
    } catch (errorValue) {
      error = errorValue;
    }
  }
}
