import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/config/assets_manager.dart';
import 'package:news_app/config/colors_manager.dart';
import 'package:news_app/config/routes_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, RoutesManager.home));
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(AssetsManager.backgroundSplash),
          Center(
            child: SizedBox(
                width: 250.w,
                height: 250.h,
                child: Image.asset(AssetsManager.logoSplash)),
          ),
        ],
      ),
    );
  }
}
