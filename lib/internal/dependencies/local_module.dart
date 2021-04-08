import 'package:news_cleaan_arch_bloc/data/local/service/article_local_service.dart';

class LocalModule{
  static LocalArticleSevice _apiUtil;

  static LocalArticleSevice getApiUtil(){
    if(_apiUtil == null){
      _apiUtil = LocalArticleSevice();
    }
    return _apiUtil;
  }
}