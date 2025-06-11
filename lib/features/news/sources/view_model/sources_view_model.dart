import 'package:flutter/material.dart';
import 'package:news_app/features/news/sources/data/model/source.dart';
import 'package:news_app/features/news/sources/data/sources_api_manager.dart';

class SourcesViewModel extends ChangeNotifier {
  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;
  Future<void> getSources(String categoryName) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await SourcesApiManager.getSources(categoryName);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
