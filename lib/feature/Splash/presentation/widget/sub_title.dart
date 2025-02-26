import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings_manger.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      AppString.welcome2,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.white.withOpacity(0.9),
      ),
    );
  }
}
