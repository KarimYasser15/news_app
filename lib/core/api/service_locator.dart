import 'package:news_app/features/news/articles/data/data_sources/articles_api_data_source.dart';
import 'package:news_app/features/news/articles/data/data_sources/articles_data_source.dart';
import 'package:news_app/features/news/sources/data/data_sources/sources_api_data_source.dart';
import 'package:news_app/features/news/sources/data/data_sources/sources_data_source.dart';

class ServiceLocator {
  static ArticlesDataSource articlesDataSource = ArticlesApiDataSource();
  static SourcesDataSource sourcesDataSource = SourcesApiDataSource();
}
