import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.h,
      right: 20.w,
      child: GestureDetector(
        onTap: () => setState(() => isChecked = !isChecked),
        child: Container(
          width: 18.w,
          height: 20.h,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: isChecked ? ColorsManger.green : ColorsManger.grey,
          ),
          child: Icon(Icons.check, color: ColorsManger.white, size: 16.sp),
        ),
      ),
    );
  }
}
