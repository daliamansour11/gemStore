// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';

class CustomButton extends StatelessWidget {
  String text;
  Color color;
  VoidCallback onPressed;
  bool isfill;
  CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.isfill,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
          // TODO: Use Colors manager...
          side: const BorderSide(color: ColorsManger.rateColor),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: 10.ph + 20.ph,
        child: Text(text,
            style: TextStyle(
                color: !isfill ? ColorsManger.rateColor : ColorsManger.white)),
      ),
    );
  }
}
