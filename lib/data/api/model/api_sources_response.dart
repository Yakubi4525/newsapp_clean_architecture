import 'package:news_cleaan_arch_bloc/data/api/model/api_source.dart';

class ApiSourceResposeModel {
  List<ApiSourceModel> sources;
  String error;
  ApiSourceResposeModel(this.sources);

  ApiSourceResposeModel.fromJson(Map<String, dynamic> json) {
    try {
      sources = (json["sources"] as List)
          .map((i) => new ApiSourceModel.fromJson(i))
          .toList();
    } catch (errorValue) {
      rethrow;
    }
  }
}
