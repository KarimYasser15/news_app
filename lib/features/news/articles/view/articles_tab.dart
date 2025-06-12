import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/articles/view/articles_item_widget.dart';
import 'package:news_app/features/news/articles/view_model/articles_states.dart';
import 'package:news_app/features/news/articles/view_model/articles_view_model.dart';

class ArticlesTab extends StatefulWidget {
  const ArticlesTab({super.key, required this.sourceId});

  final String sourceId;

  @override
  State<ArticlesTab> createState() => _ArticlesTabState();
}

class _ArticlesTabState extends State<ArticlesTab> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ArticlesViewModel();
    viewModel.getArticles(widget.sourceId, "");
    return BlocProvider.value(
      value: viewModel,
      child: BlocBuilder<ArticlesViewModel, ArticlesStates>(
        builder: (context, state) {
          if (state is GetArticlesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetArticlesErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is GetArticlesSuccesState) {
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    ArticlesItemWidget(article: state.articles[index]),
                itemCount: state.articles.length,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
