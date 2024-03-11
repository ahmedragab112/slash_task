import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/strings/app_strings.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/home/presentation/manager/home_cubit.dart';
import 'package:slash_task/feature/features/home/presentation/widgets/cart.dart';
import 'package:slash_task/feature/features/home/presentation/widgets/product.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text(
                  AppStrings.splash,
                  style: AppTextStyle.font25BoldBlue,
                ),
                const Spacer(),
                const Cart(),
                const HorizantelSpace(15),
              ],
            ).setPadding(context, vertical: 5),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current is Success || current is Fail || current is Loading,
            builder: (context, state) {
              return state.maybeWhen(
                  loading: () => SliverToBoxAdapter(
                          child: Center(
                              child: CircularProgressIndicator(
                        color: AppColor.blueColor,
                      ))),
                  loaded: (data) => SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: data.data!.length,
                      itemBuilder: (context, index) => Product(
                            data: data.data![index],
                          )),
                  failed: (error) => SliverToBoxAdapter(child: Text(error)),
                  orElse: () => const SliverToBoxAdapter());
            },
          ),
        ],
      ).setPadding(context, horizontal: 20, vertical: 3),
    );
  }
}
