import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_saved_article_models.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:rxdart/subjects.dart';

class GetSavedBloc {
  NewsRepository _newsRepository;
  GetSavedBloc(this._newsRepository);
  BehaviorSubject<ArticleResponseModel> _subject =
      BehaviorSubject<ArticleResponseModel>();
  BehaviorSubject<ArticleResponseModel> get subject => _subject;
  ArticleResponseModel get defaultitem => SavedModelInitState();
  void loadSavedModel() async {
    _subject.sink.add(SavedModelLoadingState());
    var _getSavedModel;
    try {
      _getSavedModel = await _newsRepository.getArticleFromLocal();
    } catch (error) {
      _subject.sink.add(SavedModelerrorState(error: error.toString()));
    }
    if (_getSavedModel != null) {
      _subject.sink.add(SavedModelOkState(model: _getSavedModel));
    }
  }
   dispose() {
    _subject.close();
  }
}
