import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';

class CustomColorWidget extends StatelessWidget {
  const CustomColorWidget({
    super.key,
    required this.colorValue,
    required this.width,
    required this.height,
  });
  final String colorValue;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: height.h,
        minWidth: width.w,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.blueColor, width: 1),
          shape: BoxShape.circle,
          color: Color(int.parse('0xff${colorValue.replaceAll('#', '')}'))),
    );
  }
}
