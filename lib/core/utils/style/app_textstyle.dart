import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/constant/app_constant.dart';

class AppTextStyle {
  static TextStyle font20MeduimDarkBlue = TextStyle(
    fontSize: 20.sp,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.w500,
    color: AppColor.blueDark,
  );
  static TextStyle font14BoldWhite = TextStyle(
      fontSize: 14.sp,
      fontFamily: AppConstant.poppinsFont,
      fontWeight: FontWeight.bold,
      color: Colors.white);
  static TextStyle font14RegularDarkBlue = TextStyle(
    fontSize: 14.sp,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.w400,
    color: AppColor.textBlueColor,
  );

  static TextStyle font11RegularBlueWit60Opacity = TextStyle(
    fontSize: 12.sp,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.w400,
    color: AppColor.blueColorWithOpacity60,
  );
  static TextStyle font25BoldBlue = TextStyle(
    fontSize: 25.sp,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.bold,
    color: AppColor.blueColor,
  );
  static TextStyle font18BoldBlue = TextStyle(
    fontSize: 18.sp,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.bold,
    color: AppColor.blueColor,
  );
  static TextStyle font14DarkBlueWith60OpacityMeduim = TextStyle(
    fontSize: 14.sp,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.w500,
    color: AppColor.blueColorWithOpacity60,
  );
  static TextStyle font64DarkWhiteRegular = TextStyle(
    fontSize: 64.sp,
    fontFamily: AppConstant.khmerFont,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle font24WhiteSemiBold = TextStyle(
    fontSize: 24.sp,
    fontFamily: AppConstant.poppinsFont,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
