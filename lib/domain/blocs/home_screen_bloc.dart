//events
import 'package:news_cleaan_arch_bloc/domain/model/article_response.dart';
import 'package:news_cleaan_arch_bloc/domain/model/source_response.dart';
import 'package:rxdart/rxdart.dart';

abstract class HomeScreenEvents {}

class HomeScreenInitialEvent extends HomeScreenEvents {}

//states
abstract class HomeScreenStates {}

class HomeScreenIntiailState extends HomeScreenStates {
  final ArticleResponseModel articleResponseModel;
  final SourceResposeModel sourceResposeModel;
  HomeScreenIntiailState({this.articleResponseModel, this.sourceResposeModel});
}

class HomeScreenBloc {
  BehaviorSubject<HomeScreenStates> _subject = BehaviorSubject();
  BehaviorSubject<HomeScreenStates> get subject => _subject;

  void mapEventToState(HomeScreenEvents event) {
    switch (event.runtimeType) {
      case HomeScreenInitialEvent:
        ArticleResponseModel responseModel = null; //get model from repo
        _subject.sink
            .add(HomeScreenIntiailState(articleResponseModel: responseModel));
        break;
    }
  }
}

final homeScreenBloc = HomeScreenBloc();
