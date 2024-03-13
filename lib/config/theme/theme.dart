import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(
            size: 20.sp,
          ),
          elevation: 0.0,
          color: AppColor.backGroundColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.blueColor),
          titleTextStyle: AppTextStyle.font20MeduimDarkBlue),
      scaffoldBackgroundColor: AppColor.backGroundColor,
      brightness: Brightness.dark,
      textTheme: TextTheme(
          bodyMedium: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      )));
}
