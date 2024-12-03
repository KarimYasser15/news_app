import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static final TextStyle appBar = GoogleFonts.exo(
      fontWeight: FontWeight.w400, color: ColorsManager.white, fontSize: 22.sp);
  static final TextStyle drawerTitle = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, color: ColorsManager.white, fontSize: 24.sp);
  static final TextStyle drawerItem = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, color: ColorsManager.black, fontSize: 24.sp);
  static final TextStyle languageSettings = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, color: ColorsManager.black, fontSize: 14.sp);
  static final TextStyle settingsDropDown = GoogleFonts.inter(
      fontWeight: FontWeight.w400, color: ColorsManager.green, fontSize: 14.sp);
  static final TextStyle pickCategory = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, color: ColorsManager.grey, fontSize: 22.sp);
  static final TextStyle categoryName = GoogleFonts.exo(
      fontWeight: FontWeight.w400, color: ColorsManager.white, fontSize: 22.sp);
  static final TextStyle selectedSource = GoogleFonts.exo(
      fontWeight: FontWeight.w400, color: ColorsManager.white, fontSize: 14.sp);
  static final TextStyle unSelectedSource = GoogleFonts.exo(
      fontWeight: FontWeight.w400, color: ColorsManager.green, fontSize: 14.sp);
  static final TextStyle articleSource = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, color: ColorsManager.grey, fontSize: 12.sp);
  static final TextStyle articleTitle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, color: ColorsManager.darkGrey, fontSize: 16.sp);
  static final TextStyle publishedAt = GoogleFonts.inter(
      fontWeight: FontWeight.w400, color: ColorsManager.lightGrey, fontSize: 10.sp);
  static final TextStyle viewArticle = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, color: ColorsManager.black, fontSize: 14.sp);
}
