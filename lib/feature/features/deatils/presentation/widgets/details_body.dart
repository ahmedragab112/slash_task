import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
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
                  cubit.productDetailsEntity?.data?.avaiableProperties?[index]
                      .property;
                  return AvaiableProperties(
                    atrpute: cubit.productDetailsEntity?.data
                            ?.avaiableProperties?[index].property ??
                        '',
                    valus: cubit.productDetailsEntity?.data
                            ?.avaiableProperties?[index].values ??
                        [],
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
        }
        return const SizedBox();
      },
    ).setPadding(
      context,
      vertical: 10,
    );
  }
}
/* CustomScrollView(
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
                cubit.productDetailsEntity?.data?.avaiableProperties?[index]
                    .property;
                return AvaiableProperties(
                  atrpute: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].property ??
                      '',
                  valus: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].values ??
                      [],
                );
              },
              itemCount: cubit
                      .productDetailsEntity?.data?.avaiableProperties?.length ??
                  0,
            ),
            const SliverToBoxAdapter(child: VerticalSpace(48)),
            SliverToBoxAdapter(
                child: AddToCartAndCheckOut(
              cubit: cubit,
            ))
          ],
        ),
     
 */
/*  return state.maybeWhen(
        
        orElse: () {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.blueColor,
            ),
          );
        },
        getProductDetailsLoading: () => Center(
          child: CircularProgressIndicator(
            color: AppColor.blueColor,
          ),
        ),
        getProductDetailsSuccess: (productDetailsEntity) => CustomScrollView(
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
                cubit.productDetailsEntity?.data?.avaiableProperties?[index]
                    .property;
                return AvaiableProperties(
                  atrpute: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].property ??
                      '',
                  valus: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].values ??
                      [],
                );
              },
              itemCount: cubit
                      .productDetailsEntity?.data?.avaiableProperties?.length ??
                  0,
            ),
            const SliverToBoxAdapter(child: VerticalSpace(48)),
            SliverToBoxAdapter(
                child: AddToCartAndCheckOut(
              cubit: cubit,
            ))
          ],
        ),
        getProductDetailsError: (error) => Center(
          child: Text(error),
        ),
        chnageSliderIndex: () => CustomScrollView(
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
                cubit.productDetailsEntity?.data?.avaiableProperties?[index]
                    .property;
                return AvaiableProperties(
                  atrpute: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].property ??
                      '',
                  valus: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].values ??
                      [],
                );
              },
              itemCount: cubit
                      .productDetailsEntity?.data?.avaiableProperties?.length ??
                  0,
            ),
            const SliverToBoxAdapter(child: VerticalSpace(48)),
            SliverToBoxAdapter(
                child: AddToCartAndCheckOut(
              cubit: cubit,
            ))
          ],
        ),
        decrement: () => CustomScrollView(
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
                cubit.productDetailsEntity?.data?.avaiableProperties?[index]
                    .property;
                return AvaiableProperties(
                  atrpute: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].property ??
                      '',
                  valus: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].values ??
                      [],
                );
              },
              itemCount: cubit
                      .productDetailsEntity?.data?.avaiableProperties?.length ??
                  0,
            ),
            const SliverToBoxAdapter(child: VerticalSpace(48)),
            SliverToBoxAdapter(
                child: AddToCartAndCheckOut(
              cubit: cubit,
            ))
          ],
        ),
        increment: () => CustomScrollView(
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
                cubit.productDetailsEntity?.data?.avaiableProperties?[index]
                    .property;
                return AvaiableProperties(
                  atrpute: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].property ??
                      '',
                  valus: cubit.productDetailsEntity?.data
                          ?.avaiableProperties?[index].values ??
                      [],
                );
              },
              itemCount: cubit
                      .productDetailsEntity?.data?.avaiableProperties?.length ??
                  0,
            ),
            const SliverToBoxAdapter(child: VerticalSpace(48)),
            SliverToBoxAdapter(
                child: AddToCartAndCheckOut(
              cubit: cubit,
            ))
          ],
        ),
      );
   */