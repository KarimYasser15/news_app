import 'package:flutter/material.dart';
import 'package:news_app/core/api/service_locator.dart';
import 'package:news_app/features/news/articles/data/models/articles_response/article.dart';
import 'package:news_app/features/news/articles/data/repositories/articles_repository.dart';

class ArticlesViewModel extends ChangeNotifier {
  ArticlesViewModel() {
    repository = ArticlesRepository(ServiceLocator.articlesDataSource);
  }

  List<Article>? articles;
  String? errorMessage;
  bool isLoading = false;
  late final ArticlesRepository repository;

  Future<void> getArticles(
    String sourceId,
    String? search,
  ) async {
    isLoading = true;
    notifyListeners();
    try {
      articles = await repository.getArticles(sourceId, search);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
