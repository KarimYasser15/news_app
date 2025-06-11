import 'package:flutter/material.dart';
import 'package:news_app/core/api/service_locator.dart';
import 'package:news_app/features/news/sources/data/models/source.dart';
import 'package:news_app/features/news/sources/data/repository/sources_repository.dart';

class SourcesViewModel extends ChangeNotifier {
  SourcesViewModel() {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  String? errorMessage;
  bool isLoading = false;
  late final SourcesRepository repository;
  List<Source> sources = [];

  Future<void> getSources(String categoryName) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await repository.getSources(categoryName);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
