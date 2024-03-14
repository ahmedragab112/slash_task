import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/core/utils/widget/custom_network_image.dart';
import 'package:slash_task/feature/features/home/domain/entities/product_entity.dart';
import 'package:slash_task/feature/features/home/presentation/widgets/add_to_cart_button.dart';
import 'package:slash_task/feature/features/home/presentation/widgets/price_and_quantity.dart';

class Product extends StatelessWidget {
  const Product({super.key, required this.data});
  final ProductDataEntity data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.productDetails, arguments: data.id);
      },
      child: Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: AppColor.blueColorWithOpacity30,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              CustomNetWorkImage(
                imagePath: data
                    .productVariations![0].productVarientImages![0].imagePath!,
                width: double.infinity,
                height: 128.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      data.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyle.font18BoldBlue,
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      data.description!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: AppTextStyle.font14RegularDarkBlue,
                      textAlign: TextAlign.start,
                    ),
                    PriceAndQuantity(
                      price: data.productVariations![0].price.toString(),
                      quantity: data.productVariations![0].quantity.toString(),
                    ),
                    Row(
                      children: [
                        Text(
                          'Review',
                          style: AppTextStyle.font14RegularDarkBlue,
                        ),
                        const HorizantelSpace(8),
                        Text(data.productRating.toString(),
                            style: AppTextStyle.font14RegularDarkBlue),
                        const HorizantelSpace(5),
                        Icon(
                          Icons.star,
                          color: const Color(0xffFDD835),
                          size: 15.w,
                        ),
                        const Spacer(),
                         AddToFavourite(entity:data ,)
                      ],
                    )
                  ],
                ).setPadding(context, horizontal: 8.h, vertical: 8.h),
              ),
            ],
          )),
    );
  }
}
