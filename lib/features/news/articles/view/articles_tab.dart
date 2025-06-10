import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/features/news/articles/view/articles_item_widget.dart';

class ArticlesTab extends StatelessWidget {
  const ArticlesTab({super.key, required this.sourceId});

  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(sourceId, ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.status == "error" || snapshot.hasError) {
          return Text(snapshot.data?.message ?? "Please Check Your Connection");
        }
        List<Article> articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticlesItemWidget(article: articles[index]),
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}
