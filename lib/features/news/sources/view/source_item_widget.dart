import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';

class SourceItemWidget extends StatelessWidget {
  const SourceItemWidget(
      {super.key, required this.source, required this.isSelected});

  final Source source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
          color: isSelected ? ColorsManager.green : Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: ColorsManager.green, width: 2.w)),
      margin: EdgeInsets.only(right: 10.h),
      padding: EdgeInsets.all(10.h),
      child: Center(
        child: Text(
          source.name!,
          style: isSelected
              ? AppStyles.selectedSource
              : AppStyles.unSelectedSource,
        ),
      ),
    );
  }
}
