import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import 'circul_icon.dart';

class ShippingMethod extends StatefulWidget {
  const ShippingMethod({super.key});

  @override
  State<ShippingMethod> createState() => _ShippingMethodState();
}

class _ShippingMethodState extends State<ShippingMethod> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorsManger.lightGrey),
      ),
      child: Row(
        children: [
          const CustomCircul(),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Free  ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManger.darkGrey,
                      ),
                    ),
                    TextSpan(
                      text: 'Delivery to home',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorsManger.grey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                AppString.deliveryDuration,
                style: TextStyle(color: ColorsManger.grey, fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
