import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../data/model/recommended_data.dart';
import 'recommended_product_card.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({super.key});

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
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
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
            // Horizontal Product List
            SizedBox(
              height: 66.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendedProducts.length,
                itemBuilder: (context, index) {
                  return RecommendedProductCard(
                       product: recommendedProducts[index],);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
