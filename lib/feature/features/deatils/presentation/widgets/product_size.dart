import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';

class AvaiableProperties extends StatelessWidget {
  const AvaiableProperties(
      {super.key, required this.atrpute, required this.valus});
  final String atrpute;
  final List<ValuesEntity> valus;
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
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const HorizantelSpace(8),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => atrpute == 'Color'
                  ? CustomColorWidget(
                      colorValue: valus[index].value ?? '00000000',
                    )
                  : CustomProductProperties(
                      text: valus[index].value ?? '',
                    ),
              itemCount: valus.length,
            ),
          )
        ],
      ),
    ).setPadding(context, horizontal: 16);
  }
}

class CustomProductProperties extends StatelessWidget {
  const CustomProductProperties({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      constraints: BoxConstraints(minHeight: 8.h, minWidth: 16.w),
      decoration: BoxDecoration(
        color: AppColor.blueColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: AppTextStyle.font18BoldBlue
            .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}

class CustomColorWidget extends StatelessWidget {
  const CustomColorWidget({super.key, required this.colorValue});
  final String colorValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 36.h,
        minWidth: 36.w,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.blueColor, width: 1),
          shape: BoxShape.circle,
          color: Color(int.parse('0xff${colorValue.replaceAll('#', '')}'))),
    );
  }
}
