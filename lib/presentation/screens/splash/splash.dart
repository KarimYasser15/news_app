import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/routes_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () =>
            Navigator.pushReplacementNamed(context, RoutesManager.home));
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(AssetsManager.backgroundSplash),
          Column(
              children: [
                Spacer(),
              Container(
                  width: 250.w,
                  height: 250.h,
                  child: Image.asset(AssetsManager.logoSplash)),
              Spacer(),
              Image.asset(AssetsManager.routeSplash),
          ]),
        ],
      ),
    );
  }
}
