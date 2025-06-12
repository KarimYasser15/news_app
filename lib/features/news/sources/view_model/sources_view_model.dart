import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/service_locator.dart';
import 'package:news_app/features/news/sources/data/models/source.dart';
import 'package:news_app/features/news/sources/data/repository/sources_repository.dart';
import 'package:news_app/features/news/sources/view_model/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
  SourcesViewModel() : super(SourcesInitialState()) {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  late final SourcesRepository repository;

  Future<void> getSources(String categoryName) async {
    emit(GetSourcesLoadingState());
    try {
      final List<Source> sources = await repository.getSources(categoryName);
      emit(GetSourcesSuccesstate(sources));
    } catch (error) {
      emit(GetSourcesErrortate(error.toString()));
    }
  }
}
