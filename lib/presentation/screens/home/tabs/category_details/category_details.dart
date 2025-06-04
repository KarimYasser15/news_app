import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/data_model/category.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/sources_widget/sources_widget.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.category});

  final CategoryDataModel category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
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
