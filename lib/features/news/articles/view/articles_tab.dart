import 'package:flutter/material.dart';
import 'package:news_app/features/news/articles/view/articles_item_widget.dart';
import 'package:news_app/features/news/articles/view_model/articles_view_model.dart';
import 'package:provider/provider.dart';

class ArticlesTab extends StatefulWidget {
  const ArticlesTab({super.key, required this.sourceId});

  final String sourceId;

  @override
  State<ArticlesTab> createState() => _ArticlesTabState();
}

class _ArticlesTabState extends State<ArticlesTab> {
  final viewModel = ArticlesViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getArticles(widget.sourceId, "");
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (viewModel.articles == null || viewModel.articles!.isEmpty) {
            return const Center(
              child: Text("No Articles Available"),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  ArticlesItemWidget(article: viewModel.articles![index]),
              itemCount: viewModel.articles!.length,
            ),
          );
        },
      ),
    );
  }
}
