import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/core/utils/widget/custom_network_image.dart';
import 'package:slash_task/feature/features/cart/models/favourite_model.dart';

import '../../manager/cart_cubit.dart';

class FavouriteIteam extends StatelessWidget {
  const FavouriteIteam({super.key, required this.fav});
  final FavouriteModel fav;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: 120.h,
        maxHeight: 120.h,
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColor.blueColorWithOpacity30, width: 1),
      ),
      child: Row(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border:
                  Border.all(color: AppColor.blueColorWithOpacity30, width: 2),
            ),
            child: CustomNetWorkImage(
              border: false,
              imagePath: fav.image ?? '',
              width: 120.w,
              height: double.infinity,
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fav.productName ?? '',
                      style: AppTextStyle.font18BoldBlue
                          .copyWith(color: AppColor.blueDark),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 6.h),
                          child: Text(
                            '${fav.quntity} Avaliable',
                            style: AppTextStyle.font14RegularDarkBlue.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColor.blueColor),
                            maxLines: 1,
                          ),
                        ),
                        const HorizantelSpace(8),
                        const Icon(
                          Icons.star,
                          color: Color(0xffF4B400),
                          size: 15,
                        ),
                        const HorizantelSpace(4),
                        Text(
                          '${fav.rating}',
                          style: AppTextStyle.font14RegularDarkBlue,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const HorizantelSpace(20)
                      ],
                    ),
                    Text('${fav.price} EGP',
                        style: AppTextStyle.font18BoldBlue.copyWith(
                          color: AppColor.blueDark,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis)
                  ],
                ),
                const HorizantelSpace(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().removeFavourite(fav);
                        },
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColor.blueDark,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartCubit>()
                              .addProductToCart(productId: fav.id ?? 0);
                          context.pushNamed(AppRoutes.addToCart);
                        },
                        child: Container(
                            constraints: BoxConstraints(
                                minHeight: 40.h, minWidth: 200.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 6.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.blueColor,
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                            child: Text('Add to Cart',
                                style: AppTextStyle.font14BoldWhite,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis)),
                      ),
                    ],
                  ),
                )
              ],
            ).setPadding(context, vertical: 8, horizontal: 8),
          )
        ],
      ),
    );
  }
}
