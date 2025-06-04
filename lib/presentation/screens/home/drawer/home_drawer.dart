import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/strings_manager.dart';

typedef OnDrawerClickedItem = void Function(DrawerItem);

enum DrawerItem { categories, settings }

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onDrawerClickedItem});

  final OnDrawerClickedItem onDrawerClickedItem;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 140.h,
            decoration: const BoxDecoration(color: ColorsManager.green),
            child: Center(
                child: Text(
              StringsManager.drawerTitle,
              style: AppStyles.drawerTitle,
            )),
          ),
          InkWell(
            onTap: () => onDrawerClickedItem(DrawerItem.categories),
            child: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.black,
                    size: 33.sp,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    StringsManager.categories,
                    style: AppStyles.drawerItem,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => onDrawerClickedItem(DrawerItem.settings),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 33.sp,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Text(
                    StringsManager.settings,
                    style: AppStyles.drawerItem,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
