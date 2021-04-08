import 'package:news_cleaan_arch_bloc/data/repository/news_data_repository.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_hot_news_bloc.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/api_module.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/local_module.dart';

class HotNewsModule {
  static GetHotNewsBloc _getHotNewsBloc;

  static GetHotNewsBloc getBloc() {
    if (_getHotNewsBloc == null) {
      _getHotNewsBloc =
          GetHotNewsBloc(NewsDataRepository(ApiModule.getApiutil(), LocalModule.getApiUtil()));
    }
    return _getHotNewsBloc;
  }
}
