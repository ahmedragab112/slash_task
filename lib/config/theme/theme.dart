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
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: 64.h,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 23.h,
        ),
        fillColor: Colors.white,
        filled: true,
        hintStyle:
            AppTextStyle.font18BoldBlue.copyWith(fontWeight: FontWeight.w300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColor.blueColorWithOpacity60,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColor.blueColorWithOpacity60,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(
            color: AppColor.blueColorWithOpacity60,
            width: 2,
          ),
        ),
      ));
}
