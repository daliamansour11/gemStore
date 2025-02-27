import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/model/product_model.dart';

class FeatureProductsCard extends StatelessWidget {
  final ProductModel product;
  const FeatureProductsCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 16.w), // Add spacing between items
      child: SizedBox(
        height: 227.h,
        width: 126.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.image, // Corrected image path reference
                fit: BoxFit.cover,
                width: 126.w,
                height: 172.h,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              product.title, // Access title correctly
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Text(
              '\$${product.price}', // Access price correctly
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
