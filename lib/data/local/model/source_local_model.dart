import 'package:hive/hive.dart';
part 'source_local_model.g.dart';

@HiveType(typeId: 0)
class LocalSourceModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String country;
  @HiveField(6)
  final String language;

  LocalSourceModel(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.country,
      this.language});
}
