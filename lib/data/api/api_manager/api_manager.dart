import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:news_app_c12_online_sun/data/api/model/articles_response/articles_response.dart';
import 'package:news_app_c12_online_sun/data/api/model/source_response/sources_response.dart';
//https://newsapi.org/v2/everything/sources?apiKey=b25dfb01b176424c8dc046e5a7bfa611
class ApiManager {
  static const String _baseUrl = 'newsapi.org';
  static const String _apiLKey = 'b25dfb01b176424c8dc046e5a7bfa611';
  static const String _sourcesEndPoint= 'v2/top-headlines/sources';
  static const String _articlesEndPoint= '/v2/everything';

  static Future <SourcesResponse>  getSources(String categoryId)
 async {

Uri url = Uri.https(_baseUrl , _sourcesEndPoint, {
  'apiKey':_apiLKey,
  'category':categoryId
});
http.Response serverResponse = await http.get(url);
Map<String , dynamic> json = jsonDecode(serverResponse.body);       //convert  from string body to json

//json to object from sources response
   SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
   return sourcesResponse;




  }


  static Future <ArticlesResponse> getArticles(String sourceId) async{
Uri url= Uri.https(_baseUrl , _articlesEndPoint , {
  'apiKey':_apiLKey,
  'sources':sourceId,
});
  var serverResponse = await  http.get(url);
  Map<String , dynamic> json = jsonDecode(serverResponse.body);
  ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }


  static Future <ArticlesResponse> searchArticle(String query) async{
    Uri url= Uri.https(_baseUrl , _articlesEndPoint , {
      'apiKey':_apiLKey,
      'q':query
    });
    var serverResponse = await  http.get(url);
    Map<String , dynamic> json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}