import 'package:news_cleaan_arch_bloc/data/api/model/api_source.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source.dart';

class SourceMapper {
  static SourceModel fromApi(ApiSourceModel apiSourceModel) {
    if (apiSourceModel.hasError == true) return null;
    return SourceModel(
      id: apiSourceModel.id,
      name: apiSourceModel.name,
      description: apiSourceModel.description,
      url: apiSourceModel.url,
      category: apiSourceModel.category,
      country: apiSourceModel.country,
      language: apiSourceModel.language,
    );
  }
}
