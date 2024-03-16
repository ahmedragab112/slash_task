import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/strings/app_strings.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/cart/manager/cart_cubit.dart';
import 'package:slash_task/feature/features/home/presentation/widgets/cart.dart';
import 'package:slash_task/feature/features/home/presentation/widgets/home_body.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          AppStrings.slash,
          style: AppTextStyle.font25BoldBlue,
        ),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return CustomBadge(
                    icon: Icons.shopping_cart,
                    count: cubit.cartCount.toString(),
                    function: () {
                      context.pushNamed(AppRoutes.addToCart);
                    },
                  );
                },
              );
            },
          ),
          const HorizantelSpace(20),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return CustomBadge(
                icon: Icons.favorite,
                count: cubit.favouriteCount.toString(),
                function: () {
                  context.pushNamed(AppRoutes.favourite);
                },
              );
            },
          ),
          const HorizantelSpace(20),
        ],
      ),
      body: const HomeBody(),
    );
  }
}
