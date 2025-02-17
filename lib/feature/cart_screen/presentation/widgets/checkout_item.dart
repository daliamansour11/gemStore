import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';

class ChceckOutItem extends StatelessWidget {
  final String title;
  final String price;
  bool isTotal;
  ChceckOutItem({
    required this.title,
    required this.price,
    this.isTotal = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(color: ColorsManger.grey, fontSize: 14.sp)),
        Text(price,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: isTotal? 20.sp : 14.sp)),
      ],
    );
  }
}
