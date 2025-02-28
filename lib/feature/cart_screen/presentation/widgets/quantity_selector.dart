import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({super.key});

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16.w,
      top: 65.h,
      child: Container(
        height: 30.h,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManger.grey),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove, size: 12.sp),
              onPressed: () {
                setState(() {
                  if (quantity > 1) quantity--;
                });
              },
            ),
            Text(
              quantity.toString(),
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsManger.grey),
            ),
            IconButton(
              icon: Icon(Icons.add, size: 12.sp),
              onPressed: () => setState(() => quantity++),
            ),
          ],
        ),
      ),
    );
  }
}
