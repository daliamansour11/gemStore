import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';

class CustomCircul extends StatelessWidget {
  const CustomCircul({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Container(
          width: 23.w,
          height: 23.h,
          color: ColorsManger.ratingColor,
          child: Center(
            child: Container(
              width: 8.w,
              height: 8.h,
              decoration: const BoxDecoration(
                color: ColorsManger.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
