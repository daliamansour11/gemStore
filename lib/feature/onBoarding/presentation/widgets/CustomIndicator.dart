import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';

class Customindicator extends StatelessWidget {
  final double dotIndex;
  const Customindicator({super.key, required this.dotIndex});

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotIndex,
      decorator: DotsDecorator(
        activeColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
            side: const BorderSide(color: ColorsManger.white)),
      ),
    );
  }
}
