import 'package:news_app/features/news/sources/data/data_sources/sources_data_source.dart';
import 'package:news_app/features/news/sources/data/models/source.dart';

class SourcesFirebaseDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryName) {
    throw UnimplementedError();
  }
}
