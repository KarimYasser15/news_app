import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/service_locator.dart';
import 'package:news_app/features/news/articles/data/models/articles_response/article.dart';
import 'package:news_app/features/news/articles/data/repositories/articles_repository.dart';
import 'package:news_app/features/news/articles/view_model/articles_states.dart';

class ArticlesViewModel extends Cubit<ArticlesStates> {
  ArticlesViewModel() : super(ArticlesInitialState()) {
    repository = ArticlesRepository(ServiceLocator.articlesDataSource);
  }

  late final ArticlesRepository repository;

  Future<void> getArticles(
    String sourceId,
    String? search,
  ) async {
    emit(GetArticlesLoadingState());
    try {
      List<Article> articles = await repository.getArticles(sourceId, search);
      emit(GetArticlesSuccesState(articles));
    } catch (error) {
      emit(GetArticlesErrorState(error.toString()));
    }
  }
}
