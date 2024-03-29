import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/feature/features/home/presentation/manager/home_cubit.dart';
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
                  failed: (error) =>
                      SliverToBoxAdapter(child: Center(child: Text(error))),
                  orElse: () => const SliverToBoxAdapter());
            },
          ),
        ],
      ).setPadding(context, horizontal: 20, vertical: 3),
    );
  }
}
