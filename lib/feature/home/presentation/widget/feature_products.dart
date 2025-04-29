import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../domain/home_entities/featured_products_entity.dart';
import '../Cubit/featured_products_cubit.dart';
import 'build_shimmer_loading.dart';
import 'feature_products_card.dart';

class FeatureProducts extends StatefulWidget {
  FeatureProducts({super.key, });

  @override
  State<FeatureProducts> createState() => _FeatureProductsState();
}

class _FeatureProductsState extends State<FeatureProducts> {
  @override
  void initState() {
    super.initState();
    context.read<FeaturedProductsCubit>().fetchFeaturedProducts();
  }

 late  List< FeaturedProductsEntity> product;

  @override
  Widget build(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppString.featureText,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {}, // Add navigation or function here
                        child: const Text(
                          AppString.showAll,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ColorsManger.showAll),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 227.h,
                  child:BlocBuilder<FeaturedProductsCubit, FeaturedProductsState>(
    builder: (_, state) {
    if (state is FeaturedProductsLoading) {
    return buildShimmerLoading();    }
    if (state is FeaturedProductsError) {
      print('responsefromApiiiiiiiiiiiiiii: ${state.message}');

      return const Center(child: Icon(Icons.refresh));
    }
    if (state is FeaturedProductsLoaded) {

      product = state.products;
    return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: product.length,
          itemBuilder: (context, index) {
            return FeatureProductsCard(
              product:product[index],);

          },

    );}
    return const SizedBox();


  })),
              ],
            );
          }
}
