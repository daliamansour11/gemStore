import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';

class TopProduct extends StatelessWidget {
  const TopProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            AppString.topText,
            style:
            TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,color: ColorsManger.black),
          ),
          TextButton(
            onPressed: () {}, // Add navigation or function here
            child:  Text(
             AppString.topText,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManger.showAll),
            ),
          ),
        ],
      ),
    );
  }
}
