import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/custom_color.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/product_prooerties.dart';

class AvaiableProperties extends StatelessWidget {
  const AvaiableProperties(
      {super.key,
      required this.atrpute,
      required this.color,
      required this.text});
  final String atrpute;
  final String color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return VerticalSpace(
      100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            atrpute,
            style: AppTextStyle.font18BoldBlue.copyWith(
              color: AppColor.blueDark,
              fontWeight: FontWeight.w500,
            ),
          ),
          const VerticalSpace(8),
          atrpute == 'Color'
              ? CustomColorWidget(
                  colorValue: color,
                  width: 35.w,
                  height: 35.h,
                )
              : CustomProductProperties(
                  text: text,
                ),
        ],
      ),
    ).setPadding(context, horizontal: 16);
  }
}
