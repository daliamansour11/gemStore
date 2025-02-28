
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';

class ToggleOptionWidget extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isLight;
  final ValueChanged<bool> onToggle;

  const ToggleOptionWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.isLight,
    required this.onToggle,
  });

  @override
  _ToggleOptionWidgetState createState() => _ToggleOptionWidgetState();
}

class _ToggleOptionWidgetState extends State<ToggleOptionWidget> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isLight;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
          widget.onToggle(isSelected);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: AppPadding.p8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 16.sp,
                color: isSelected
                    ? ColorsManger.black
                    : ColorsManger.category2Color,
              ),
              SizedBox(width: 7.w),
              Text(
                widget.text,
                style: TextStyle(

                  color: isSelected
                      ? ColorsManger.black
                      : ColorsManger.category2Color,

                  fontWeight: FontWeight.w500,
                  fontSize: 13
,                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
