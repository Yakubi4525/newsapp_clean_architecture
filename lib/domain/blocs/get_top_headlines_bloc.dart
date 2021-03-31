import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/repository_module.dart';
import 'package:rxdart/rxdart.dart';

class GetTopHeadLinesBloc {
  final NewsRepository _newsRepository = RepositoryModule.newsRepository();

  final BehaviorSubject<ArticleResponseModel> _subject =
      BehaviorSubject<ArticleResponseModel>();

       getHeadlines() async {
    // ArticleResponseModel response = await _repository.getTopHeadlines();
    // _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  //BehaviorSubject<ArticleResponse> get subject => _subject;
}
