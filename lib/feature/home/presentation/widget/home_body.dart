import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../injection_container.dart';
import '../../domain/home_entities/featured_products_entity.dart';
import '../Cubit/main_categories_cubit.dart';
import 'recommended_product.dart';
import 'top_product.dart';
import 'banner_section.dart';
import 'category_section.dart';
import 'feature_products.dart';
import 'new_collection.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, this.product});
  final List<FeaturedProductsEntity>? product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategorySection(),
            5.vs,
            const BannerSection(),
            5.vs,
            FeatureProducts(),
            5.vs,
            const NewCollectionBanner(),
            5.vs,
            const RecommendedProducts(),
            5.vs,
            const TopProduct()
          ],
        ),
      ),
    );
  }
}
