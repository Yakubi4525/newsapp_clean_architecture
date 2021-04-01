import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';

class SourcesModelInitialState extends SourceResposeModel {}

class SourcesModelLoadingState extends SourceResposeModel {}

class SourcesModelErrorState extends SourceResposeModel {
  String error;
  SourcesModelErrorState({this.error});
}

class SourcsesModelOkState extends SourceResposeModel {
  SourcsesModelOkState({SourceResposeModel model}) : super(sources: model.sources);
}
