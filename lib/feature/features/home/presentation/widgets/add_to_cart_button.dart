import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/feature/features/favourite/data/models/favourite_model.dart';
import 'package:slash_task/feature/features/home/domain/entities/product_entity.dart';

class AddToFavourite extends StatelessWidget {
  const AddToFavourite({super.key, required this.entity});

  final ProductDataEntity entity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.favourite,
            arguments: FavouriteModel(
                quntity: entity.productVariations?[0].quantity,
                rating: entity.productRating,
                id: entity.id,
                image: entity
                    .productVariations![0].productVarientImages![0].imagePath,
                price: (entity.productVariations?[0].price ?? 0).toString(),
                productName: entity.name));
      },
      child: Container(
          width: 30.w,
          height: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.blueColor,
          ),
          child: Icon(Icons.favorite, color: Colors.white, size: 20.sp)),
    );
  }
}
