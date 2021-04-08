import 'package:news_cleaan_arch_bloc/data/local/model/source_local_model.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source.dart';

class LocalSourceMapper {
    static LocalSourceModel toLocal(SourceModel sourceModel) {
    if (sourceModel==null) return null;
    return LocalSourceModel(
      id: sourceModel.id,
      name: sourceModel.name,
      description: sourceModel.description,
      url: sourceModel.url,
      category: sourceModel.category,
      country: sourceModel.country,
      language: sourceModel.language,
    );
  }
}
