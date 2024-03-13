import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';

class AddToFavourite extends StatelessWidget {
  const AddToFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 30.w,
          height: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.blueColor,
          ),
          child: Icon(Icons.favorite, color: Colors.white, size: 20.sp)),
    );
  }
}
