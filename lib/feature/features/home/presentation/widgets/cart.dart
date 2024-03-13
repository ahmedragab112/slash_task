import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/cart/presentation/manager/cart_cubit.dart';

class Cart extends StatelessWidget {
  const Cart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.addToCart);
      },
      child: badges.Badge(
          badgeStyle: badges.BadgeStyle(
            padding: EdgeInsets.all(5.sp),
          ),
          position: badges.BadgePosition.topEnd(top: -10, end: -12),
          showBadge: true,
          badgeContent: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Text(cubit.cartCount.toString(),
                  style: AppTextStyle.font14BoldWhite);
            },
          ),
          badgeAnimation: const badges.BadgeAnimation.scale(
            animationDuration: Duration(seconds: 20),
            curve: Curves.ease,
            colorChangeAnimationCurve: Curves.ease,
          ),
          child: ImageIcon(
            const AssetImage(
              "assets/images/shopping_cart.png",
            ),
            size: 27.sp,
            color: AppColor.blueColor,
          )),
    );
  }
}
