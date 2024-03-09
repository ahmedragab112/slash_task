import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: AppColor.backGroundColor,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: AppColor.backGroundColor,
      brightness: Brightness.dark,
      textTheme: TextTheme(
          bodyMedium: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      )));
}
