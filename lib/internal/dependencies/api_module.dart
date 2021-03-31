import 'package:news_cleaan_arch_bloc/data/api/api_util.dart';
import 'package:news_cleaan_arch_bloc/data/api/service/news_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil getApiutil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(NewsService());
    }
    return _apiUtil;
  }
}
