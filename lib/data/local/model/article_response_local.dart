import 'package:hive/hive.dart';
import 'package:news_cleaan_arch_bloc/data/local/model/article_local_model.dart';
part 'article_response_local.g.dart';


@HiveType(typeId: 2)
class LocalArticleResponseModel {
  @HiveField(0)
  final List<LocalArticleModel> articles;

  LocalArticleResponseModel(this.articles);
}
