import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/custom_icon.dart';

class SelectQuantity extends StatelessWidget {
  const SelectQuantity(
      {super.key, required this.avaliable, required this.cubit});
  final int avaliable;
  final ProductDetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.blueColor,
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIcon(
              onTap: () {
                cubit.decrementPrice();
              },
              icon: Icons.remove,
            ),
            BlocBuilder<ProductDetailsCubit, ProductdetilsState>(
              builder: (context, state) {
                return Text(
                  cubit.quantity.toString(),
                  style: AppTextStyle.font20MeduimDarkBlue
                      .copyWith(color: Colors.white),
                );
              },
            ),
            CustomIcon(
              onTap: () {
                cubit.incrementPrice(avaliable);
              },
              icon: Icons.add,
            ),
          ],
        ));
  }
}
