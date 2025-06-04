import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/model/articles_response/articles_response.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';

class ApiManager {
  static String _baseUrl = "newsapi.org";
  static String _apiKey = "eb92579dd1ab49e09d45172b9d2bad3f";
  static String _sourcesEndPoint = "/v2/top-headlines/sources";
  static String _articlesEndPoint = "/v2/everything";

  static Future<SourcesResponse> getSources(String categoryName) async {
    Uri url = Uri.https(_baseUrl, _sourcesEndPoint,
        {'apiKey': _apiKey, 'category': categoryName});
    http.Response serverResponse = await http.get(url);
    var jsonResponse = jsonDecode(serverResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonResponse);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticles(
      String? sourceId, String? search) async {
    Uri url = Uri.https(_baseUrl, _articlesEndPoint,
        {'apiKey': _apiKey, 'sources': sourceId, 'q': search});
    http.Response serverResponse = await http.get(url);
    var jsonResponse = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(jsonResponse);
    return articlesResponse;
  }
}
