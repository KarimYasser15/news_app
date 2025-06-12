import 'package:news_app/features/news/sources/data/models/source.dart';

abstract class SourcesStates {}

class SourcesInitialState extends SourcesStates {}

class GetSourcesLoadingState extends SourcesStates {}

class GetSourcesSuccesstate extends SourcesStates {
  GetSourcesSuccesstate(this.sources);

  final List<Source> sources;
}

class GetSourcesErrortate extends SourcesStates {
  GetSourcesErrortate(this.errorMessage);

  final String errorMessage;
}
