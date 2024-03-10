import 'package:flutter/material.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';

class PriceAndQuantity extends StatelessWidget {
  const PriceAndQuantity(
      {super.key, required this.price, required this.quantity});
  final String price;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'EGP $price',
          style: AppTextStyle.font14RegularDarkBlue.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const HorizantelSpace(16),
        Text(
          'Quantity : $quantity',
          style: AppTextStyle.font14RegularDarkBlue
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
