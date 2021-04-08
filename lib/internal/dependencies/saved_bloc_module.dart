import 'package:news_cleaan_arch_bloc/data/repository/news_data_repository.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_saved_bloc.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/api_module.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/local_module.dart';

class SavedBlocModule {
  static GetSavedBloc _savedBloc;

  static GetSavedBloc getBloc() {
    if (_savedBloc == null) {
      _savedBloc = GetSavedBloc(
          NewsDataRepository(ApiModule.getApiutil(), LocalModule.getApiUtil()));
    }
    return _savedBloc;
  }
}
