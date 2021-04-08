import 'package:news_cleaan_arch_bloc/data/api/model/api_source.dart';
import 'package:news_cleaan_arch_bloc/data/local/model/source_local_model.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source.dart';

class SourceMapper {
  static SourceModel fromApi(ApiSourceModel apiSourceModel) {
    if (apiSourceModel.hasError == true) return SourceModel();
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
    static SourceModel fromLocal(LocalSourceModel localSourceModel) {
    if (localSourceModel==null) return null;
    return SourceModel(
      id: localSourceModel.id,
      name: localSourceModel.name,
      description: localSourceModel.description,
      url: localSourceModel.url,
      category: localSourceModel.category,
      country: localSourceModel.country,
      language: localSourceModel.language,
    );
  }
}
