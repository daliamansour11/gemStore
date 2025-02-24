import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
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
    double screenWidth = context.screenWidth;
    double screenHeight = context.screenHeight;
    Orientation orientation = MediaQuery.of(context).orientation;
    double defaultSize = orientation == Orientation.landscape
        ? screenHeight * .024
        : screenWidth * .024;

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
        Expanded( // Ensures image takes up available space
          child: Image.asset(
            imagePath,
            width: 261.w, // Responsive width
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
