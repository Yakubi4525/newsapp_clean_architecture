import 'package:news_cleaan_arch_bloc/data/repository/news_data_repository.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_source_news_bloc.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/api_module.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/local_module.dart';

class SourceNewsModule {
  static GetSourceNewsBloc _getSourceNewsBloc;

  static GetSourceNewsBloc getBloc() {
    if (_getSourceNewsBloc == null) {
      _getSourceNewsBloc =
          GetSourceNewsBloc(NewsDataRepository(ApiModule.getApiutil(), LocalModule.getApiUtil()));
    }
    return _getSourceNewsBloc;
  }
}
