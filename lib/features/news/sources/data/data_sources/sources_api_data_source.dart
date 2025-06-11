import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/features/news/sources/data/data_sources/sources_data_source.dart';
import 'package:news_app/features/news/sources/data/models/source.dart';
import 'package:news_app/features/news/sources/data/models/sources_response.dart';

class SourcesApiDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryName) async {
    Uri url = Uri.https(ApiManager.baseUrl, ApiManager.sourcesEndPoint,
        {'apiKey': ApiManager.apiKey, 'category': categoryName});
    http.Response serverResponse = await http.get(url);
    var jsonResponse = jsonDecode(serverResponse.body);
    final SourcesResponse sourcesResponse =
        SourcesResponse.fromJson(jsonResponse);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Failed to get sources!');
    }
  }
}
