import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manger.dart';

class CustomRichText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final TextStyle? style;
  const CustomRichText(
      {required this.firstText,
      required this.secondText,
      this.style,
      super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: style ??
                TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: ColorsManger.grey,
                ),
          ),
          TextSpan(
            text: secondText,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: ColorsManger.black,
            ),
          ),
        ],
      ),
    );
  }
}
