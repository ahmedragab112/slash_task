import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/core/utils/widget/add_to_cart_button.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';

class AddToCartAndCheckOut extends StatefulWidget {
  const AddToCartAndCheckOut({super.key, required this.cubit});

  final ProductdetilsCubit cubit;

  @override
  State<AddToCartAndCheckOut> createState() => _AddToCartAndCheckOutState();
}

class _AddToCartAndCheckOutState extends State<AddToCartAndCheckOut> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
            BlocBuilder<ProductdetilsCubit, ProductdetilsState>(
              builder: (context, state) {
                return Text(
                  'EGP ${widget.cubit.quantity * (widget.cubit.productDetailsEntity?.data?.variations?[widget.cubit.variationsIndex].price ?? 0)}',
                  style: AppTextStyle.font18BoldBlue.copyWith(
                      color: AppColor.blueDark, fontWeight: FontWeight.w500),
                );
              },
            )
          ],
        ),
        const HorizantelSpace(30),
        const Expanded(child: AddToCartButton()),
      ],
    ).setPadding(context, horizontal: 16);
  }
}