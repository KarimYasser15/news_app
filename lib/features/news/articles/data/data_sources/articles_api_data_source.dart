import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/features/news/articles/data/data_sources/articles_data_source.dart';
import 'package:news_app/features/news/articles/data/models/articles_response/article.dart';
import 'package:news_app/features/news/articles/data/models/articles_response/articles_response.dart';

class ArticlesApiDataSource extends ArticlesDataSource {
  @override
  Future<List<Article>> getArticles(String? sourceId, String? search) async {
    Uri url = Uri.https(ApiManager.baseUrl, ApiManager.articlesEndPoint,
        {'apiKey': ApiManager.apiKey, 'sources': sourceId, 'q': search});
    http.Response serverResponse = await http.get(url);
    var jsonResponse = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(jsonResponse);
    if (articlesResponse.status == 'ok' && articlesResponse.articles != null) {
      return articlesResponse.articles!;
    } else {
      throw Exception('Failed to get articles!');
    }
  }
}
