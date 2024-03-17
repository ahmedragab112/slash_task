import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/strings/app_strings.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/details_body.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                      leading: IconButton.outlined(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back)),
                      title: const Text(AppStrings.productDetails),
                      actions: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 30.sp,
                        ),
                        const HorizantelSpace(16),
                      ]),
                ],
            body: const DetailsBody()));
  }
}
