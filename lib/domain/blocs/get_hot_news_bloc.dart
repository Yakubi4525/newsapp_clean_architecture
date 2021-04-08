import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_hot_news_models.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetHotNewsBloc {
  NewsRepository _newsRepository;
  GetHotNewsBloc(this._newsRepository);

  BehaviorSubject<ArticleResponseModel> _subject =
      BehaviorSubject<ArticleResponseModel>();

  BehaviorSubject<ArticleResponseModel> get subject => _subject;

  ArticleResponseModel get defaultitem => HotNewsModelIntnState();

  void loadHotNewsModel() async {
    _subject.sink.add(HotNewsModelLoadingState());

    var _getHotNewsModel;
    try {
      _getHotNewsModel = await _newsRepository.getHotNews();
    } catch (error) {
      _subject.sink.add(HotNewsModelErrorState(error: error.toString()));
    }
    if (_getHotNewsModel != null) {
      _subject.sink.add(HotNewsModelOkState(model: _getHotNewsModel));
    }
  }

  dispose() {
    _subject.close();
  }
}
