import 'package:hive/hive.dart';
import 'package:news_cleaan_arch_bloc/data/local/model/source_local_model.dart';
part 'article_local_model.g.dart';

@HiveType(typeId: 1)
class LocalArticleModel {
  @HiveField(0)
  final LocalSourceModel source;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final String img;
  @HiveField(6)
  final String date;
  @HiveField(7)
  final String content;

  LocalArticleModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.img,
      this.date,
      this.content});
}
