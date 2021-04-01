import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_top_head_models.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetTopHeadlinesBloc {
  NewsRepository _newsRepository;

  final BehaviorSubject<ArticleResponseModel> _subject =
      BehaviorSubject<ArticleResponseModel>();

  GetTopHeadlinesBloc(this._newsRepository);
  ArticleResponseModel get defaultitem => TopHeadModelInintState();
  BehaviorSubject<ArticleResponseModel> get subject => _subject;

  void loadTopHeadLinesModel() async {
    _subject.sink.add(TopHeadModelLoadingState());
    var topHeadLinesModel;
    try {
      topHeadLinesModel = await _newsRepository.getTopHeadLines();
    } catch (error) {
      _subject.sink.add(TopHeadModelErrorState(error: error.toString()));
    }
    if (topHeadLinesModel != null) {
      _subject.sink.add(TopHeadModelOkState(model: topHeadLinesModel));
    } else {
      _subject.sink.add(TopHeadModelErrorState(error: "Ошибка"));
    }
  }

  dispose() {
    _subject.close();
  }
}
