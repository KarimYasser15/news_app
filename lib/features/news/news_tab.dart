import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/categories/data_model/category.dart';
import 'package:news_app/features/news/sources/data/models/source.dart';
import 'package:news_app/features/news/sources/view/sources_widget.dart';
import 'package:news_app/features/news/sources/view_model/sources_states.dart';
import 'package:news_app/features/news/sources/view_model/sources_view_model.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key, required this.category});

  final CategoryDataModel category;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  @override
  Widget build(BuildContext context) {
    final SourcesViewModel viewModel = SourcesViewModel();
    viewModel.getSources(widget.category.title);
    return BlocProvider.value(
        value: viewModel,
        child: BlocBuilder<SourcesViewModel, SourcesStates>(
          builder: (context, state) {
            if (state is GetSourcesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetSourcesErrortate) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else if (state is GetSourcesSuccesstate) {
              final List<Source> sources = state.sources;
              return SourcesWidget(sources: sources);
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
