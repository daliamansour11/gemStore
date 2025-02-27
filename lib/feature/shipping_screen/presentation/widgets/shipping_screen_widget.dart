import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import 'shipping_form.dart';

class ShippingBody extends StatelessWidget {
  const ShippingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.white,
      appBar: customAppBar(title: AppString.checkOut, context: context),
      body: Padding(
        padding: 20.ph,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: 30.pv + 50.ph,
              child: Image.asset(ImageAssets.checkOutIcon),
            ),
            Padding(
              padding: 16.pl,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppString.firstStep,
                      style:
                          TextStyle(color: ColorsManger.grey, fontSize: 11.sp),
                    ),
                    TextSpan(
                      text: AppString.shipping,
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorsManger.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 37.h),
            const Expanded(child: ShippingForm()),
          ],
        ),
      ),
    );
  }
}
