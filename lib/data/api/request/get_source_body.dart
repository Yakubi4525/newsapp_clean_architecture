import 'package:news_cleaan_arch_bloc/data/api/service/news_service.dart';

class GetSourceBody{
    Map<String, dynamic> toApi(){
      return {"apiKey": NewsService.apiKey, "language": "en", "country": "us"};
    }
}