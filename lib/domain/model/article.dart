import 'package:news_cleaan_arch_bloc/domain/model/source.dart';

class ArticleModel {
  final SourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String img;
  final String date;
  final String content;

  ArticleModel({this.source, this.author, this.title, this.description, this.url,
      this.img, this.date, this.content});
}
