import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton(
      {super.key,
      required this.text,
      this.icon = Icons.add_shopping_cart_sharp, this.onTap});
  final String text;
  final IconData icon;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColor.blueColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: AppTextStyle.font20MeduimDarkBlue
                    .copyWith(color: Colors.white)),
            const HorizantelSpace(24),
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
