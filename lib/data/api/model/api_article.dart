import 'api_source.dart';

class ApiArticleModel {
  final ApiSourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String img;
  final String date;
  final String content;
  bool hasError;

  ApiArticleModel(this.source, this.author, this.title, this.description,
      this.url, this.img, this.date, this.content);

  ApiArticleModel.fromJson(Map<String, dynamic> json)
      : hasError = true ? json == null : false,
        source = ApiSourceModel.fromJson(json["source"]),
        author = json["author"],
        title = json["title"],
        description = json["description"],
        url = json["url"],
        img = json["urlToImage"],
        date = json["publishedAt"],
        content = json["content"];
}
