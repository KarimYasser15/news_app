import 'package:flutter/material.dart';
import 'package:news_app/features/categories/data_model/category.dart';
import 'package:news_app/features/news/sources/data/model/source.dart';
import 'package:news_app/features/news/sources/view/sources_widget.dart';
import 'package:news_app/features/news/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key, required this.category});

  final CategoryDataModel category;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

final SourcesViewModel viewModel = SourcesViewModel();

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    viewModel.getSources(widget.category.title);
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<SourcesViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<Source> sources = viewModel.sources;
            return SourcesWidget(sources: sources);
          },
        ));
  }
}
