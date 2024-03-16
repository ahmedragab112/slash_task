import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/feature/features/cart/manager/cart_cubit.dart';

import '../../../../../core/utils/color/app_color.dart';

class AddToCartIcon extends StatelessWidget {
  const AddToCartIcon({super.key, required this.productId});
  final int productId;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return GestureDetector(
      onTap: () {
        cubit.addProductToCart(productId: productId);
      },
      child: Container(
          width: 30.w,
          height: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.blueColor,
          ),
          child: Icon(Icons.shopping_cart, color: Colors.white, size: 20.sp)),
    );
  }
}
