import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/features/categories/data_model/category.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categoryDM});
  final CategoryDataModel categoryDM;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDM.bgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              bottomRight: Radius.circular(categoryDM.isLeft ? 0.r : 25.r),
              bottomLeft: Radius.circular(categoryDM.isLeft ? 25.r : 0.r),
              topRight: Radius.circular(25.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            categoryDM.categoryImage,
            height: 110.h,
          ),
          Text(categoryDM.title, style: AppStyles.categoryName)
        ],
      ),
    );
  }
}
