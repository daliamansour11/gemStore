import 'package:flutter/material.dart';

import '../../../../core/resources/strings_manger.dart';
import '../../../../core/widget/custom_rich_text.dart';

class QuantityAndTotal extends StatelessWidget {
  final String quantity;
  final String subTotal;
  const QuantityAndTotal({
    required this.quantity,
    required this.subTotal,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomRichText(
            firstText: AppString.quantity,
            secondText: quantity),
        CustomRichText(
            firstText: AppString.subtotalSign,
            secondText: subTotal),
      ],
    );
  }
}
