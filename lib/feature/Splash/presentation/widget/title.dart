import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      AppString.welcome,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24.sp, // Using .sp for text scaling
        fontWeight: FontWeight.bold,
        color: ColorsManger.white,
      ),
    );
  }
}
