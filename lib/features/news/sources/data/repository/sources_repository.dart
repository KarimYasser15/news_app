import 'package:news_app/features/news/sources/data/data_sources/sources_data_source.dart';
import 'package:news_app/features/news/sources/data/models/source.dart';

class SourcesRepository {
  SourcesRepository(this.dataSource);

  final SourcesDataSource dataSource;

  Future<List<Source>> getSources(String categoryName) {
    return dataSource.getSources(categoryName);
  }
}
