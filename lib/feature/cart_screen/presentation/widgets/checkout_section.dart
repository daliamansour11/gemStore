import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_store/core/resources/colors_manger.dart';

import '../../../../core/resources/strings_manger.dart';
import 'checkout_item.dart';
import 'custom_button.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsManger.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChceckOutItem(title: AppString.productPrice , price: "\$110"),
          SizedBox(height: 8.h),
          const Divider(color: ColorsManger.grey),
          SizedBox(height: 8.h),
          ChceckOutItem(title: AppString.shipping , price: AppString.freeShipping),
          SizedBox(height: 12.h),
          const Divider(color: ColorsManger.grey),
          SizedBox(height: 12.h),
          ChceckOutItem(title: AppString.subtotal , price: "\$110", isTotal: true),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: (){},
            title: AppString.proceedToCheckout,
          ),
        ],
      ),
    );
  }
}
