import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/strings/app_strings.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/core/utils/widget/add_to_cart_button.dart';
import 'package:slash_task/feature/features/cart/data/models/cart_model.dart';
import 'package:slash_task/feature/features/cart/presentation/widgets/product_iteam_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  quantity: 10,
                  id: 1,
                  productName: 'Nicks ',
                  price: 2000,
                  color: 12324,
                  productColor: 'Red',
                  productImage:
                      'https://th.bing.com/th/id/OIP.YguOkIP2xIjpoReX_q0R4gHaHa?rs=1&pid=ImgDetMain',
                  productSize: '3123',
                )),
                separatorBuilder: (context, index) => const VerticalSpace(10),
                itemCount: 20,
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
