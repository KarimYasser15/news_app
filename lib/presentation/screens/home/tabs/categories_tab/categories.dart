import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/data_model/category.dart';

import 'category_widget/category_widget.dart';

typedef OnCategoryClicked = void Function(CategoryDataModel);

class Categories extends StatelessWidget {
  Categories({super.key, required this.onCategoryClicked});

  List<CategoryDataModel> allCategories = CategoryDataModel.getAllCategories;
  OnCategoryClicked onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.h, left: 30.w, right: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pick Your Category\n of interest",
              style: AppStyles.pickCategory,
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClicked(allCategories[index]);
                },
                child: CategoryWidget(categoryDM: allCategories[index]),
              ),
              itemCount: allCategories.length,
            ))
          ],
        ),
      ),
    );
  }
}
