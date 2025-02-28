import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manger.dart';

class PageViewItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;

  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 20, color: ColorsManger.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 14, color: ColorsManger.black),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 4.h),
        Expanded( 
          child: Image.asset(
            imagePath,
            width: 261.w,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
