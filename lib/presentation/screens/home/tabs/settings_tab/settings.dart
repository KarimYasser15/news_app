import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_styles.dart';
import 'package:news_app/core/utils/colors_manager.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  static List<String> language = ["English", "Arabic"];

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String languageSelected = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 29.w),
            child: Text(
              "Language",
              style: AppStyles.languageSettings,
            ),
          ),
          Center(
            child: Container(
              width: 320.w,
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.r),
                      side: const BorderSide(color: ColorsManager.green)),
                  color: Colors.white),
              child: DropdownButton(
                underline: Container(color: Colors.transparent),
                borderRadius: BorderRadius.circular(8.r),
                style: AppStyles.settingsDropDown,
                dropdownColor: Colors.white,
                iconEnabledColor: ColorsManager.green,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                value: languageSelected,
                items: ["English", "Arabic"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    languageSelected = value!;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
