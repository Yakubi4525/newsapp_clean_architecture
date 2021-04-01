import 'package:news_cleaan_arch_bloc/data/repository/news_data_repository.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/get_sources_bloc.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/api_module.dart';

class SourcesModule {
  static GetSourcesBloc _getSourcesBloc;

  static GetSourcesBloc getBloc() {
    if (_getSourcesBloc == null) {
      _getSourcesBloc =
          GetSourcesBloc(NewsDataRepository(ApiModule.getApiutil()));
    }
    return _getSourcesBloc;
  }
}
