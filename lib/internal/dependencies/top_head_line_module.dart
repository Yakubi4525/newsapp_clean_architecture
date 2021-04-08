import 'package:news_cleaan_arch_bloc/data/repository/news_data_repository.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_top_headlines_bloc.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/api_module.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/local_module.dart';

class TopHaedLineModule {
  static GetTopHeadlinesBloc _getTopHeadlinesBloc;

  static GetTopHeadlinesBloc getBloc() {
    if (_getTopHeadlinesBloc == null) {
      _getTopHeadlinesBloc =
      GetTopHeadlinesBloc(NewsDataRepository(ApiModule.getApiutil(), LocalModule.getApiUtil()));
    }
    return _getTopHeadlinesBloc;
  }
}
