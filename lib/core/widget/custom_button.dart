import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extentions/sizes_utils_extensions.dart';
import '../resources/colors_manger.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
final  Color color;
final  bool isFill;
  const CustomButton({
    super.key,
    required this.text,
    this.width = 250,
    this.height = 50,
    this.onPressed,
    required this.color,

    required this.isFill,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: ColorsManger.grey.withOpacity(0.5),
          foregroundColor: ColorsManger.white,
          side: const BorderSide(color: ColorsManger.white, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child:  Padding(
          padding: 10.ph + 20.ph,
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: isFill ? ColorsManger.rateColor : ColorsManger.btnColor)),
        ),



      ),
    );
  }
}
