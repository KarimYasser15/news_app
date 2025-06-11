import 'package:news_app/features/news/sources/data/models/source.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSources(String categoryName);
}
