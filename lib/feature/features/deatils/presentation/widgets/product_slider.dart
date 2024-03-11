import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/slider_item.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    super.key,
    required this.cubit,
  });
  final ProductdetilsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return VerticalSpace(
      300.h,
      child: BlocBuilder<ProductdetilsCubit, ProductdetilsState>(
        builder: (context, state) {
          return CarouselSlider(
              items: cubit.productDetailsEntity?.data
                  ?.variations?[cubit.variationsIndex].productVarientImages
                  ?.map((e) => SliderItem(
                        imagePath: e.imagePath ??
                            'https://th.bing.com/th/id/R.50ba6c05d96ee7b9155219c1c16c1e3b?rik=hqWcGXHFIGMCDg&pid=ImgRaw&r=0',
                        length: cubit
                                .productDetailsEntity
                                ?.data
                                ?.variations?[cubit.variationsIndex]
                                .productVarientImages
                                ?.length ??
                            0,
                        index: cubit.productVarientImagesIndex,
                      ))
                  .toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  cubit.changeSliderIndex(index);
                },
                viewportFraction: 1,
                autoPlay: true,
                scrollDirection: Axis.horizontal,
              ));
        },
      ),
    ).setOnlyPadding(context, right: 6.w, left: 16.w);
  }
}
