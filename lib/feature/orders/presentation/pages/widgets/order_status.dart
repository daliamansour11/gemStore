import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manger.dart';
import '../../../../../core/resources/strings_manger.dart';
import 'custom_order_grey_box__shop.dart';

class OrderStauts extends StatelessWidget {
  final String orderStatus;
  const OrderStauts({required this.orderStatus, super.key});

  @override
  Widget build(BuildContext context) {
    return CutomGreyOrderBox(
      title: orderStatus == AppString.delivered
          ? AppString.orderDeliveried
          : AppString.orderOnWay,
      description: orderStatus == AppString.delivered ? AppString.rateProducts : AppString.trackProducts,
      image: const AssetImage(ImageAssets.deliverImg),
    );
  }
}