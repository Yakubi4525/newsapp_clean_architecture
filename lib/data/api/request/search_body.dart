import 'package:news_cleaan_arch_bloc/data/api/service/news_service.dart';

class SearchBody {
  final String value;

  SearchBody({this.value});
  Map<String, dynamic> toApi() {
    return {"apiKey": NewsService.apiKey, "q": value, "sortBy": "popularity"};
  }
}
