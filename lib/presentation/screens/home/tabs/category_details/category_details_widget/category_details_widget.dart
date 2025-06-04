import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/category_details_widget/category_details_item_widget.dart';

class CategoryDetailsWidget extends StatelessWidget {
  const CategoryDetailsWidget({super.key, required this.sourceId});

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
                CategoryDetailsItemWidget(article: articles[index]),
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}
