import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/core/utils/widget/custom_network_image.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice(
      {super.key,
      required this.title,
      required this.price,
      required this.brandImage});
  final String title;
  final String price;
  final String brandImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppTextStyle.font18BoldBlue.copyWith(
                color: AppColor.blueDark,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const HorizantelSpace(20),
            CustomNetWorkImage(
              imagePath: brandImage,
              width: 60.w,
              height: 60.h,
              border: false,
              borderRadius: BorderRadius.circular(16.r),
            )
          ],
        ),
        Text(
          price,
          style: AppTextStyle.font18BoldBlue
              .copyWith(color: AppColor.blueDark, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
