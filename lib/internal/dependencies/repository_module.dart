import 'package:news_cleaan_arch_bloc/data/repository/news_data_repository.dart';
import 'package:news_cleaan_arch_bloc/domain/repository/news_repository.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/api_module.dart';
import 'package:news_cleaan_arch_bloc/internal/dependencies/local_module.dart';

class RepositoryModule {
  static NewsRepository _newsRepository;

  static NewsRepository newsRepository() {
    if (_newsRepository == null) {
      return NewsDataRepository(ApiModule.getApiutil(), LocalModule.getApiUtil());
    }
    return _newsRepository;
  }
}
