import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/custom_color.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/product_prooerties.dart';

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
                      colorValue: valus[index].value ?? '00000000', width: 35.w,
                      height: 35.h,
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
