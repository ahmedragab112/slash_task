import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/widget/custom_network_image.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';

class AnOtherProductsFromTheSameVariations extends StatelessWidget {
  const AnOtherProductsFromTheSameVariations(
      {super.key,
      required this.index,
      required this.cubit,
      required this.variationsEntity});

  final int index;
  final VariationsEntity variationsEntity;
  final ProductDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return VerticalSpace(100,
        child: Row(
            children: variationsEntity.productVarientImages != null
                ? variationsEntity.productVarientImages!
                    .map((e) => GestureDetector(
                          onTap: () {
                            context.pushReplacementNamed(
                                AppRoutes.productDetails,
                                arguments:
                                    cubit.productDetailsEntity!.data!.id);
                          },
                          child: Container(
                            constraints:
                                BoxConstraints(minWidth: 50.w, minHeight: 50.h),
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                    color: AppColor.blueColor, width: 2)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.r),
                                child: CustomNetWorkImage(
                                    imagePath: e.imagePath ?? '',
                                    width: 80.w,
                                    height: 80.h)),
                          ),
                        ))
                    .toList()
                : []));
  }
}

/* imagePath: cubit
                      .productDetailsEntity
                      ?.data
                      ?.variations?[cubit.variationsIndex]
                      .productVarientImages
                      ?.last
                      .imagePath ??
                  'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?size=626&ext=jpg',
            */
            /*
            GestureDetector(
      onTap: () {
        context.pushReplacementNamed(AppRoutes.productDetails,
            arguments: cubit.productDetailsEntity!.data!.id);
      },
      child: Container(
        constraints: BoxConstraints(minWidth: 50.w, minHeight: 50.h),
        foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: AppColor.blueColor, width: 2)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: CustomNetWorkImage(
                imagePath: imagePath, width: 80.w, height: 80.h)),
      ),
    );*/