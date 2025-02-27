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
      spacing: 13.w,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(item.image, fit: BoxFit.cover),
        ),
        Expanded(
          child: Column(
            spacing: 16.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(
                  // TODO: Try to make a Styels file.
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                ),
              ),
              Text(
                '\$${item.price}',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
              ),
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
