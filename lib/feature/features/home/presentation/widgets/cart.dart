import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/cart/manager/cart_cubit.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    required this.icon,
    required this.count, required this.function,
  });
  final IconData icon;
  final String count;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: badges.Badge(
          onTap: () {
            function();
          },
          badgeStyle: badges.BadgeStyle(
            padding: EdgeInsets.all(5.sp),
          ),
          position: badges.BadgePosition.topEnd(top: -10, end: -12),
          showBadge: true,
          badgeContent: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Text(count,
                  style: AppTextStyle.font14BoldWhite);
            },
          ),
          badgeAnimation: const badges.BadgeAnimation.scale(
            animationDuration: Duration(seconds: 2),
            curve: Curves.ease,
            colorChangeAnimationCurve: Curves.ease,
          ),
          child: Icon(
            icon,
            color: AppColor.blueColor,
            size: 27.sp,
          )),
    );
  }
}
