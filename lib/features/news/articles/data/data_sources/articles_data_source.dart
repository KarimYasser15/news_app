import 'package:news_app/features/news/articles/data/models/articles_response/article.dart';

abstract class ArticlesDataSource {
  Future<List<Article>> getArticles(String? sourceId, String? search);
}
