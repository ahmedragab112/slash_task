import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/strings/app_strings.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/favourite/data/models/favourite_model.dart';
import 'package:slash_task/feature/features/favourite/presentation/widgets/favouite_iteam.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key, required this.fav});
  final FavouriteModel fav;
  @override
  Widget build(BuildContext context) {
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
              SliverList.separated(
                itemBuilder: (context, index) => FavouriteIteam(
                  fav: fav,
                ),
                separatorBuilder: (context, index) => const VerticalSpace(10),
                itemCount: 20,
              ),
            ],
          ).setPadding(context, horizontal: 16, vertical: 28)),
    );
  }
}
