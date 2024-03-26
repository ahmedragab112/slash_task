import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/custom_color.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/product_prooerties.dart';

class AvaiableProperties extends StatelessWidget {
  const AvaiableProperties(
      {super.key, required this.text, required this.avaiableProperties});

  final String text;
  final AvaiablePropertiesEntity avaiableProperties;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductDetailsCubit>();
    return VerticalSpace(
      100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            avaiableProperties.property ?? '',
            style: AppTextStyle.font18BoldBlue.copyWith(
              color: AppColor.blueDark,
              fontWeight: FontWeight.w500,
            ),
          ),
          const VerticalSpace(8),
          avaiableProperties.property == 'Color'
              ? Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              cubit.variationsIndex = index;
                              cubit.changeSelectedColorIndex(index);
                              cubit.selectIndex(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.blueColor,
                              ),
                              padding: cubit.selectedColorIndex == index
                                  ? const EdgeInsets.all(4)
                                  : EdgeInsets.zero,
                              child: CustomColorWidget(
                                colorValue:
                                    avaiableProperties.values?[index].value ??
                                        '',
                                width: 35.w,
                                height: 35.h,
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          const HorizantelSpace(8),
                      itemCount: avaiableProperties.values?.length ?? 0),
                )
              : CustomProductProperties(
                  text: text,
                ),
        ],
      ),
    ).setPadding(context, horizontal: 16);
  }
}
