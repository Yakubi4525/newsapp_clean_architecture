import 'package:news_cleaan_arch_bloc/data/api/service/news_service.dart';

class GetHotNewsBody {
  Map<String, dynamic> toApi() {
    return {"apiKey": NewsService.apiKey, "q": "apple", "sortBy": "popularity"};
  }
}
