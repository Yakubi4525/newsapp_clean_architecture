
import 'package:flutter/foundation.dart';
import 'package:news_cleaan_arch_bloc/domain/bloc_models/bloc_source_news_models.dart';
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourceNewsBloc {
  NewsRepository _newsRepository;
  GetSourceNewsBloc(this._newsRepository);

  BehaviorSubject<ArticleResponseModel> _subject =
      BehaviorSubject<ArticleResponseModel>();

  BehaviorSubject<ArticleResponseModel> get subject => _subject;

  void loadSourceNewsModel(String sourceId) async {
    _subject.sink.add(SourceNewsModelLoadingState());
    var sourceNewsModel;
    try {
      sourceNewsModel = await _newsRepository.getSourcesNews(sourceId:sourceId);
    } catch (error) {
      _subject.sink.add(SourceNewsModelErrorState(error: error.toString()));
    }
    if (sourceNewsModel != null) {
      _subject.sink.add(SourceNewsModelOkState(model: sourceNewsModel));
    } else {
      _subject.sink.add(SourceNewsModelErrorState(error: " Ошибка "));
    }
  }

  // void drainStream() {
  //   _subject.value = null;
  // }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  ArticleResponseModel get defaultitem => SourceNewsModelInitState();
}
