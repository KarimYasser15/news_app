import 'package:flutter/material.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/category_details_widget/category_details_widget.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/sources_widget/source_item_widget.dart';

class SourcesWidget extends StatefulWidget {
  const SourcesWidget({super.key, required this.sources});

  final List<Source> sources;

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
                padding: EdgeInsets.only(top: 10.h, left: 0),
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                onTap: (value) {
                  selectedIndex = value;
                  setState(() {});
                },
                labelPadding: EdgeInsets.only(left: 10.w),
                isScrollable: true,
                tabs: widget.sources
                    .map(
                      (source) => SourceItemWidget(
                        source: source,
                        isSelected: widget.sources[selectedIndex] == source
                            ? true
                            : false,
                      ),
                    )
                    .toList())),
        CategoryDetailsWidget(sourceId: widget.sources[selectedIndex].id!),
      ],
    );
  }
}
