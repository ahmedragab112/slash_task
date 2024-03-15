import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/strings/app_strings.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/core/utils/widget/add_to_cart_button.dart';
import 'package:slash_task/feature/features/cart/manager/cart_cubit.dart';
import 'package:slash_task/feature/features/cart/models/cart_model.dart';
import 'package:slash_task/feature/features/cart/presentation/widgets/product_iteam_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  title: Text(AppStrings.cart,
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
                itemBuilder: (context, index) => ProductCartIteam(
                    carte: CartModel(
                        quantity: cubit.cartData[index].data?.variations?[0]
                                .quantity ??
                            0,
                        id: cubit.cartData[index].data!.id!,
                        productName: cubit.cartData[index].data!.name!,
                        price:
                            cubit.cartData[index].data!.variations?[0].price ??
                                0,
                        productPropertiesValues: cubit.cartData[index].data!
                                .variations?[0].productPropertiesValues ??
                            [],
                        productImage: cubit.cartData[index].data!.variations?[0]
                                .productVarientImages?[0].imagePath ??
                            '')),
                separatorBuilder: (context, index) => const VerticalSpace(10),
                itemCount: cubit.cartData.length,
              ),
              const SliverToBoxAdapter(child: VerticalSpace(50)),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total price ',
                          style: AppTextStyle.font18BoldBlue
                              .copyWith(color: AppColor.blueColorWithOpacity60),
                        ),
                        const VerticalSpace(10),
                        Text(
                          'EGP 35000',
                          style: AppTextStyle.font18BoldBlue.copyWith(
                              color: AppColor.blueDark,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const HorizantelSpace(30),
                    const Expanded(
                        child: AddToCartButton(
                      text: 'Check Out',
                      icon: Icons.arrow_right_alt_rounded,
                    )),
                  ],
                ),
              )
            ],
          ).setPadding(context, horizontal: 16, vertical: 28)),
    );
  }
}
