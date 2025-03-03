import 'package:flutter/material.dart';

import '../../../../../core/extentions/extentions.dart';
import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../../../../../core/resources/strings_manger.dart';
import '../../../../../core/utils/bottom_navigation.dart';
import '../../../../../core/widget/custom_button.dart';
import '../rate_product.dart';

class FullOrderActions extends StatelessWidget {
  const FullOrderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
            isFill: false,
            text: AppString.returnHome,
            color: ColorsManger.white,
            onPressed: () => context.pushNamed(const BottomNavigation())),
        CustomButton(
          isFill: true,
          text: AppString.rateOrder,
          color: ColorsManger.rateColor,
          onPressed: () => context.pushNamed(const RateProduct()),
        ),
      ],
    );
  }
}

class OneOrderAction extends StatelessWidget {
  const OneOrderAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 50.pv + 15.ph,
      child: CustomButton(
        isFill: true,
        text: AppString.continueShopping,
        color: ColorsManger.rateColor,
        onPressed: () => context.pushNamed(const BottomNavigation()),
      ),
    );
  }
}
