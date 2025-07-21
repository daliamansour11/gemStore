import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../Cubit/recommended_products_cubit.dart';
import '../Cubit/recommended_products_state.dart';
import '../cubit/main_Categories_cubit.dart';
import 'build_shimmer_loading.dart';
import 'recommended_product_card.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RecommendedProductsCubit>();
    final mainCategoryCubit = context.read<MainCategoriesCubit>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.recommendedText,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppString.showAll,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManger.showAll),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
                height: 66.h,
                child: BlocBuilder<RecommendedProductsCubit,
                    RecommendedProductsState>(builder: (context, state) {
                  if (state is RecommendedProductsLoading) {
                    return buildShimmerLoading();
                  }

                  if (state is RecommendedProductsError) {
                    print('Error from API: ${state.message}');
                    return const Center(child: Icon(Icons.refresh));
                  }

                  if (state is RecommendedProductsLoaded) {
                    final products = state.products;
                    return NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                          cubit.getRecommendedProductsByCategory(
                              categoryId: mainCategoryCubit
                                  .mainCategories[
                                      mainCategoryCubit.selectedIndex]
                                  .id!,
                              isLoadMore: true);
                        }
                        return true;
                      },
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return RecommendedProductCard(
                            product: products[index],
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                })),
          ],
        );
      },
    );
  }
}
