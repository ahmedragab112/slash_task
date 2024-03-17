import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/strings/app_strings.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/cart/manager/cart_cubit.dart';
import 'package:slash_task/feature/features/cart/presentation/widgets/favouite_iteam.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  title: Text(AppStrings.favourite,
                      style: AppTextStyle.font20MeduimDarkBlue),
                  actions: [
                    Image.asset(
                      'assets/images/shopping_cart.png',
                      width: 27.w,
                      height: 27.h,
                    ),
                    const HorizantelSpace(15),
                  ],
                )
              ],
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return SliverList.separated(
                    itemBuilder: (context, index) => FavouriteIteam(
                      fav: cubit.favouriteList[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const VerticalSpace(10),
                    itemCount: cubit.favouriteList.length,
                  );
                },
              ),
            ],
          ).setPadding(context, horizontal: 16, vertical: 28)),
    );
  }
}
