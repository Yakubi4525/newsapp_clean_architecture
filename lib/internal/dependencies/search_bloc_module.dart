import 'package:news_cleaan_arch_bloc/data/repository/news_data_repository.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_search_bloc.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/api_module.dart';

class SearchBlocModule {
  static GetSearchBloc _searchBloc;

  static GetSearchBloc getBloc() {
    if (_searchBloc == null) {
      _searchBloc = GetSearchBloc(NewsDataRepository(ApiModule.getApiutil()));
    }
    return _searchBloc;
  }
}
