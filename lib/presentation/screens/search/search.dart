import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: ColorsManager.white,
          image:
              DecorationImage(image: AssetImage(AssetsManager.homeBackground)),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.white),
              child: TextField(
                style: TextStyle(),
                decoration: InputDecoration(
                    fillColor: Colors.white, hintText: "Search"),
              ),
            ),
            //actions: [Center(child: Container(width: 200.w,child: SearchBar()))],
          ),
        ));
  }
}
