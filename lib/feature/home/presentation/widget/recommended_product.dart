import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../domain/home_entities/recommended_products_entity.dart';
import '../Cubit/recommended_products_cubit.dart';
import '../Cubit/recommended_products_state.dart';
import 'build_shimmer_loading.dart';
import 'recommended_product_card.dart';

class RecommendedProducts extends StatefulWidget {
  const RecommendedProducts({super.key});

  @override
  State<RecommendedProducts> createState() => _RecommendedProductsState();
}

class _RecommendedProductsState extends State<RecommendedProducts> {
  @override
  void initState() {
    super.initState();
    context
        .read<RecommendedProductsCubit>()
        .getRecommendedProductsByCategory(categoryId: 1);
  }

  @override
  Widget build(BuildContext context) {
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
                    List<RecommendedProductsEntity> product = state.products;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: context
                          .read<RecommendedProductsCubit>()
                          .products
                          .length,
                      itemBuilder: (context, index) {
                        return RecommendedProductCard(
                          product: context
                              .read<RecommendedProductsCubit>()
                              .products[index],
                        );
                      },
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
