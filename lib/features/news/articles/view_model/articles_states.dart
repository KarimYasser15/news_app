import 'package:news_app/features/news/articles/data/models/articles_response/article.dart';

abstract class ArticlesStates {}

class ArticlesInitialState extends ArticlesStates {}

class GetArticlesLoadingState extends ArticlesStates {}

class GetArticlesSuccesState extends ArticlesStates {
  GetArticlesSuccesState(this.articles);

  final List<Article> articles;
}

class GetArticlesErrorState extends ArticlesStates {
  GetArticlesErrorState(this.errorMessage);

  final String errorMessage;
}
