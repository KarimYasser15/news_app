import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/my_theme.dart';
import 'package:news_app/core/api/service_locator.dart';
import 'package:news_app/features/news/articles/data/models/articles_response/article.dart';
import '../news/articles/view/articles_item_widget.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: MyTheme.lightTheme.appBarTheme,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.r),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        child: const Icon(Icons.search),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: const Icon(Icons.close)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ServiceLocator.articlesDataSource.getArticles("", query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Article> articleResponse = snapshot.data!;
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticlesItemWidget(article: articleResponse[index]),
            itemCount: articleResponse.length,
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ServiceLocator.articlesDataSource.getArticles("", query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Article>? articles = snapshot.data;
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticlesItemWidget(article: articles![index]),
            itemCount: articles?.length ?? 0,
          ),
        );
      },
    );
  }
}
