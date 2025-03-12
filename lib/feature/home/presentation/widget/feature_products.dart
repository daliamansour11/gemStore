import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../data/model/product_data.dart';
import 'feature_products_card.dart';

class FeatureProducts extends StatelessWidget {
  const FeatureProducts({super.key});

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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        SizedBox(
          height: 227.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:ProductModel. products.length,
            itemBuilder: (context, index) {
              return FeatureProductsCard( product:ProductModel. products[index],); // Pass a single product
            },
          ),
        ),
      ],
    );
  }

}
