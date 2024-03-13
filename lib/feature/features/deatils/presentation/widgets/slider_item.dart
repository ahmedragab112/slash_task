import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/widget/custom_network_image.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderItem extends StatelessWidget {
  const SliderItem(
      {super.key,
      required this.imagePath,
      required this.length,
      required this.index});
  final String imagePath;
  final int index;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      margin: EdgeInsets.only(right: 10.w),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColor.blueColorWithOpacity30, width: 2),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: CustomNetWorkImage(
                imagePath: imagePath,
                width: double.infinity,
                height: double.infinity),
          ),
          Positioned(
            bottom: 4,
            child: BlocBuilder<ProductDetailsCubit, ProductdetilsState>(
              builder: (context, state) {
                return AnimatedSmoothIndicator(
                  count: length,
                  curve: Curves.easeIn,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColor.blueColor,
                    dotHeight: 10.h,
                    dotColor: Colors.white,
                    expansionFactor: 4,
                    dotWidth: 10.w,
                  ),
                  activeIndex: index,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
