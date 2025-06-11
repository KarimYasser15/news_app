import 'package:news_app/features/news/articles/data/data_sources/articles_data_source.dart';
import 'package:news_app/features/news/articles/data/models/articles_response/article.dart';

class ArticlesRepository {
  ArticlesRepository(this.dataSource);

  final ArticlesDataSource dataSource;

  Future<List<Article>> getArticles(String? sourceId, String? search) {
    return dataSource.getArticles(sourceId, search);
  }
}
