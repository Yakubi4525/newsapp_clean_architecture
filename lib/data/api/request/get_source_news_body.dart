import 'package:news_cleaan_arch_bloc/data/api/service/news_service.dart';

class GetSourceNewsBody{
  final String sourceId;

  GetSourceNewsBody({this.sourceId});

  Map<String,dynamic> toApi(){
    return  {"apiKey": NewsService.apiKey, "sources": sourceId};
  }
}