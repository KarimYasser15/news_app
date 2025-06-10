import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/features/categories/data_model/category.dart';
import 'package:news_app/features/news/sources/view/sources_widget.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key, required this.category});

  final CategoryDataModel category;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  Source? selectedSource;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.category.title),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.status == "error" || snapshot.hasError) {
          return Text(snapshot.data?.message ?? "Please Check Your Connection");
        }
        List<Source> sources = snapshot.data!.sources!;
        selectedSource ??= sources[0];
        return SourcesWidget(sources: sources);
      },
    );
  }
}
