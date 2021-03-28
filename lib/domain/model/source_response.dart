import 'package:news_cleaan_arch_bloc/domain/model/source.dart';

class SourceResposeModel {
  final List<SourceModel> sources;
  final String error;

  SourceResposeModel(this.sources, this.error);
  
}
