import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/core/utils/strings/app_strings.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/feature/features/deatils/domain/entities/product_details_entity.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/another_product_.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/quantity_and_rating.dart';
import 'package:slash_task/feature/features/deatils/presentation/widgets/title_and_price.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
    required this.cubit,
  });
  final ProductDetailsCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const VerticalSpace(24),
        VerticalSpace(
          100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount:
                cubit.productDetailsEntity?.data?.variations?.length ?? 0,
            itemBuilder: (context, index) =>
                AnOtherProductsFromTheSameVariations(
              index: index,
              cubit: cubit,
              variationsEntity:
                  cubit.productDetailsEntity?.data?.variations?[index] ??
                      VariationsEntity(),
              selected: cubit.selected,
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const HorizantelSpace(5),
          ),
        ),
        const VerticalSpace(24),
        Text(
          cubit.productDetailsEntity?.data?.name ?? '',
          style: AppTextStyle.font25BoldBlue,
        ),
        const VerticalSpace(16),
        TitleAndPrice(
          title: cubit.productDetailsEntity?.data?.brandName ?? '',
          price:
              'EGP  ${cubit.productDetailsEntity?.data?.variations?[cubit.variationsIndex].price.toString() ?? ''}',
          brandImage: cubit.productDetailsEntity?.data?.brandImage ??
              'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?size=626&ext=jpg',
        ),
        const VerticalSpace(16),
        QuantityAndRating(
          quntity: cubit.productDetailsEntity?.data
                  ?.variations?[cubit.variationsIndex].quantity
                  .toString() ??
              '0',
          rating: cubit.productDetailsEntity?.data?.productRating ?? 0,
          cubit: cubit,
        ),
        const VerticalSpace(16),
        Text(
          AppStrings.description,
          style: AppTextStyle.font18BoldBlue.copyWith(
            color: AppColor.blueDark,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
        const VerticalSpace(8),
        ReadMoreText(
          cubit.productDetailsEntity?.data?.description ?? '',
          trimLines: 3,
          colorClickableText: AppColor.blueDark,
          trimMode: TrimMode.Line,
          textAlign: TextAlign.start,
          trimCollapsedText: 'Read more',
          trimExpandedText: '...Show less',
          style: AppTextStyle.font14DarkBlueWith60OpacityMeduim,
        ),
        const VerticalSpace(16),
      ],
    ).setPadding(context, horizontal: 16);
  }
}
