import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'recommended_product.dart';
import 'top_product.dart';
import 'banner_section.dart';
import 'category_section.dart';
import 'feature_products.dart';
import 'new_collection.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategorySection(),
            SizedBox(
              height:5.h,
            ),
            const BannerSection(),
            SizedBox(
              height:5.h,
            ),
            const FeatureProducts(),
            SizedBox(
              height:5.h,
            ),
            const NewCollectionBanner(),
            SizedBox(
              height:5.h,
            ),
            const RecommendedProducts(),
            SizedBox(
              height:5.h,
            ),
            const TopProduct()
          ],
        ),
      ),
    );
  }
}
