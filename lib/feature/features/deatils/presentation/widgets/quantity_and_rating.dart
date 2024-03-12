import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/select_quantity.dart';

class QuantityAndRating extends StatelessWidget {
  const QuantityAndRating(
      {super.key,
      required this.quntity,
      required this.rating,
      required this.cubit});
  final String quntity;
  final ProductDetailsCubit cubit;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border:
                Border.all(color: AppColor.blueColorWithOpacity30, width: 2),
          ),
          child: Text(
            '$quntity Avaliable',
            style: AppTextStyle.font14RegularDarkBlue
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        const HorizantelSpace(16),
        const Icon(
          Icons.star,
          color: Color(0xffF4B400),
          size: 15,
        ),
        const HorizantelSpace(4),
        Text('$rating ', style: AppTextStyle.font14RegularDarkBlue),
        const HorizantelSpace(20),
        Expanded(
            child: SelectQuantity(avaliable: int.parse(quntity), cubit: cubit))
      ],
    );
  }
}
