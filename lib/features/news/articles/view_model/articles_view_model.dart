import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/features/news/articles/data/articles_api_manager.dart';

class ArticlesViewModel extends ChangeNotifier {
  List<Article>? articles;
  bool isLoading = false;
  String? errorMessage;
  Future<void> getArticles(
    String sourceId,
    String? search,
  ) async {
    isLoading = true;
    notifyListeners();
    try {
      articles = await ArticlesApiManager.getArticles(sourceId, search);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
