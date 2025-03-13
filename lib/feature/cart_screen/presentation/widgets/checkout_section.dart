import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/global/global.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../shipping_screen/presentation/pages/shipping_screen.dart';
import 'checkout_item.dart';
import 'custom_button.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.all,
      decoration: BoxDecoration(
        color: ColorsManger.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsManger.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // spacing: 8.h,
        children: [
          ChceckOutItem(title: AppString.productPrice, price: '\$110'),
          Divider(color: ColorsManger.grey),
          ChceckOutItem(title: AppString.shipping, price: AppString.freeShipping),
          Divider(color: ColorsManger.grey),
          ChceckOutItem(title: AppString.subtotal, price: '\$110', isTotal: true),
          CustomButton(
            //! TODO: Remember to use onGenerateRoute in main.dart
            // TODO:Did not found it !
            onPressed: () {
              Global.analytics.logEvent(
                name: 'checkOut button_clicked',
                parameters: {
                  'button_name': 'Proceed to Checkout ',
                },
              );
              context.pushNamed(const ShippingScreen());},

            title: AppString.proceedToCheckout,
          ),
        ],
      ),
    );
  }
}
