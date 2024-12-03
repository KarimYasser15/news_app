import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/my_theme.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/data/model/articles_response/articles_response.dart';

import '../home/tabs/category_details/category_details_widget/category_details_item_widget.dart';

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
          borderSide: BorderSide.none, // Removes default border
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        child: Icon(Icons.search),
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
          icon: Icon(Icons.close)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(future: ApiManager.getArticles("", query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.status == "error" || snapshot.hasError) {
          return Text(snapshot.data?.message ?? "Please Check Your Connection");
        }
        List<Article> articleResponse  = snapshot.data!.articles!;
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                CategoryDetailsItemWidget(article: articleResponse[index]),
            itemCount: articleResponse.length,
          ),
        );
      },);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(future: ApiManager.getArticles("", query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Text(snapshot.data?.message ?? "Please Check Your Connection");
        }
        ArticlesResponse articleResponse  = snapshot.data!;
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                CategoryDetailsItemWidget(article: articleResponse.articles![index]),
            itemCount: articleResponse.articles?.length ?? 0,
          ),
        );
      },);
  }
}
