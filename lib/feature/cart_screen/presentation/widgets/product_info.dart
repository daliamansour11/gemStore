import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../domain/entities/cart_item.dart';

class ProductInfo extends StatelessWidget {
  final CartItem item;
  const ProductInfo({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(item.image, fit: BoxFit.cover),
        ),
        SizedBox(width: 13.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                item.title,
                style: TextStyle(
                  // TODO: Try to make a Styels file.
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 13.h),
              Text(
                '\$${item.price}',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 13.h),
              Text(
                'Size: ${item.size}  |  Color: ${item.color}',
                style: TextStyle(
                  color: ColorsManger.grey,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
