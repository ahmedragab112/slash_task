import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/feature/features/home/presentation/manager/home_cubit.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeCubit>().addToCartCounter();
      },
      child: Container(
          width: 30.w,
          height: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.blueColor,
          ),
          child:
              Icon(Icons.add_shopping_cart, color: Colors.white, size: 20.sp)),
    );
  }
}
