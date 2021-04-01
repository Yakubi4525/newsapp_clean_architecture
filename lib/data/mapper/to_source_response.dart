import 'package:news_cleaan_arch_bloc/data/api/model/api_sources_response.dart';
import 'package:news_cleaan_arch_bloc/data/mapper/to_source.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';

class SourceResponseModelMapper {
  static SourceResposeModel fromApi(
      ApiSourceResposeModel apiSourceResposeModel) {
    if (apiSourceResposeModel.sources == null)
      return SourceResposeModel(sources: []);
    return SourceResposeModel(
        sources:
            apiSourceResposeModel.sources.map((e) => SourceMapper.fromApi(e)).toList());
  }
}
