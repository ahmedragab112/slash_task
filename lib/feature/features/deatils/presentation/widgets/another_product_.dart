import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/widget/custom_network_image.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';

class AnOtherProductsFromTheSameVariations extends StatelessWidget {
  const AnOtherProductsFromTheSameVariations(
      {super.key,
      required this.index,
      required this.cubit,
      required this.variationsEntity,
      required this.selected});

  final int index;
  final VariationsEntity variationsEntity;
  final ProductDetailsCubit cubit;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.selectIndex(index);
        cubit.variationsIndex = index;
        cubit.changeSliderIndex(0);
      },
      child: Container(
          padding: const EdgeInsets.all(4),
          decoration: cubit.selectedInde == index
              ? BoxDecoration(
                  color: AppColor.blueColor,
                  borderRadius: BorderRadius.circular(15.r))
              : null,
          child: Container(
            constraints: BoxConstraints(minWidth: 50.w, minHeight: 50.h),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColor.blueColor, width: 2)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CustomNetWorkImage(
                    imagePath:
                        variationsEntity.productVarientImages?[0].imagePath ??
                            '',
                    width: 80.w,
                    height: 80.h)),
          )),
    );
  }
}
