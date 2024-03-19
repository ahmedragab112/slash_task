import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/add_to_cart_and_price.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/product_details_body.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/product_size.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/product_slider.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductDetailsCubit>();
    return BlocBuilder<ProductDetailsCubit, ProductdetilsState>(
      builder: (context, state) {
        if (state is GetProductDetailsSuccess ||
            state is ChangeSliderIndex ||
            state is Increment ||
            state is Decrement) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ProductSlider(
                  cubit: cubit,
                ),
              ),
              SliverToBoxAdapter(
                child: ProductDetailsBody(
                  cubit: cubit,
                ),
              ),
              SliverList.separated(
                separatorBuilder: (context, index) => const VerticalSpace(8),
                itemBuilder: (context, index) {
                  return AvaiableProperties(
                    atrpute: cubit
                            .productDetailsEntity
                            ?.data
                            ?.variations?[cubit.variationsIndex]
                            .productPropertiesValues?[index]
                            .property ??
                        '', color:cubit
                            .productDetailsEntity
                            ?.data
                            ?.variations?[cubit.variationsIndex]
                            .productPropertiesValues?[index]
                            .value??  '00000000', text:cubit
                            .productDetailsEntity
                            ?.data
                            ?.variations?[cubit.variationsIndex]
                            .productPropertiesValues?[index]
                            .value?? '' ,
                
                  );
                },
                itemCount: cubit.productDetailsEntity?.data?.avaiableProperties
                        ?.length ??
                    0,
              ),
              const SliverToBoxAdapter(child: VerticalSpace(48)),
              SliverToBoxAdapter(
                  child: AddToCartAndCheckOut(
                cubit: cubit,
              ))
            ],
          );
        } else if (state is GetProductDetailsLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.blueColor,
            ),
          );
        } else if (state is GetProductDetailsError) {
          return Center(
              child: Text(
            state.error,
            style: AppTextStyle.font25BoldBlue,
          ));
        }
        return const Center();
      },
    ).setPadding(
      context,
      vertical: 10,
    );
  }
}
