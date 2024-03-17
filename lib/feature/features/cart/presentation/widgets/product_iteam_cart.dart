import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/core/utils/widget/custom_network_image.dart';
import 'package:slash_task/feature/features/cart/models/cart_model.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/custom_color.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/custom_icon.dart';

class ProductCartIteam extends StatelessWidget {
  const ProductCartIteam({super.key, required this.carte});
  final CartModel carte;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxHeight: 120.h),
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
              imagePath: carte.productImage ?? '',
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carte.productName,
                      style: AppTextStyle.font18BoldBlue
                          .copyWith(color: AppColor.blueDark),
                    ),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => ColorAndSize(
                                color: carte.productPropertiesValues?[index]
                                        .property ??
                                    '',
                                size: carte.productPropertiesValues?[index]
                                        .value ??
                                    '',
                              ),
                          itemCount:
                              carte.productPropertiesValues?.length ?? 0),
                    ),
                    Text(
                      '${carte.price} EGP',
                      style: AppTextStyle.font18BoldBlue
                          .copyWith(color: AppColor.blueDark),
                    )
                  ],
                ),
                const HorizantelSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.delete_outline_rounded,
                        color: AppColor.blueDark,
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 10.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColor.blueColor,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIcon(
                                onTap: () {},
                                icon: Icons.remove,
                              ),
                              Text(
                                carte.quantity.toString(),
                                style: AppTextStyle.font20MeduimDarkBlue
                                    .copyWith(color: Colors.white),
                              ),
                              CustomIcon(
                                onTap: () {},
                                icon: Icons.add,
                              ),
                            ],
                          )),
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

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.color, required this.size});
  final String? color;
  final String? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomColorWidget(
          colorValue: (color ?? 0000).toString(),
          width: 15.w,
          height: 15.h,
        ),
        const HorizantelSpace(8),
        Text(
          '${color ?? ''} | ${size ?? ''}',
          style: AppTextStyle.font14RegularDarkBlue.copyWith(
            color: AppColor.blueDark.withOpacity(.60),
          ),
        ),
      ],
    );
  }
}
