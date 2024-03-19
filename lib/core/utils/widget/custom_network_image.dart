import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/constant/app_constant.dart';

class CustomNetWorkImage extends StatelessWidget {
  const CustomNetWorkImage(
      {super.key,
      required this.imagePath,
      required this.width,
      required this.height,
      this.fit = BoxFit.fill,
      this.border = true,
      this.borderRadius = BorderRadius.zero});
  final String imagePath;
  final double width;
  final double height;
  final BoxFit fit;
  final bool border;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: border
          ? BorderRadius.only(
              topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r))
          : borderRadius,
      child: CachedNetworkImage(
        
          imageUrl: imagePath,
          placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                color: AppColor.blueColor,
              )),
          fit: fit,
          height: height,
          width: width,
          errorWidget: (context, url, error) => Image.asset(
                AppConstant.noData,
                width: double.infinity,
                height: double.infinity,
              )),
    );
  }
}
