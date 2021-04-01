import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_sources_models.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourcesBloc {
  NewsRepository _newsRepository;

  final BehaviorSubject<SourceResposeModel> _subject =
      BehaviorSubject<SourceResposeModel>();
  GetSourcesBloc(this._newsRepository);

  SourceResposeModel get deffultitem => SourcesModelInitialState();
  BehaviorSubject<SourceResposeModel> get subject => _subject;
  void loadSourcesBloc() async {
    _subject.sink.add(SourcesModelLoadingState());

    var sourcesModel;
    try {
      sourcesModel = await _newsRepository.getSources();
    } catch (error) {
      _subject.sink.add(SourcesModelErrorState(error: error.toString()));
    }
    if (sourcesModel != null) {
      _subject.sink.add(SourcsesModelOkState(model: sourcesModel));
    } else {
      _subject.sink.add(SourcesModelErrorState(error: "Ошибка"));
    }
  }

  dispose() {
    _subject.close();
  }
}
