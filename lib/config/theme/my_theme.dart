import 'package:flutter/material.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsManager.green,
          primary: ColorsManager.green,
          onPrimary: ColorsManager.white),
      scaffoldBackgroundColor: Colors.transparent,
      drawerTheme: DrawerThemeData(backgroundColor: ColorsManager.white),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: ColorsManager.white),
          backgroundColor: ColorsManager.green,
          centerTitle: true,
          titleTextStyle: AppStyles.appBar,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(50.r)))));
}
