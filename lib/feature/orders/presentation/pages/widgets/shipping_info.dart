import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../../../../../core/resources/strings_manger.dart';
import 'custom_order_item.dart';

class ShippingInfo extends StatelessWidget {
  const ShippingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.all,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.r),
        color: ColorsManger.white,
        boxShadow: [kCustomBoxShadow],
      ),
      child: Column(
        children: [
          _orderProducts(),
          20.vs,
          _orderShippingInfo(),
          30.vs,
        ],
      ),
    );
  }
}

Widget _orderProducts() {
  return Column(
    children: [
      CustomOrderItem(
          isBold: false,
          detailName: 'Maxi Dress',
          quantity: 'x1',
          price: '\$68.00'),
      CustomOrderItem(
          isBold: false,
          detailName: 'Linen Dress',
          quantity: 'x1',
          price: '\$52.00'),
    ],
  );
}

Widget _orderShippingInfo() {
  return Column(
    children: [
      CustomOrderItem(
              withquantity: false,
              isBold: true,
              detailName: AppString.subtotal,
              price: '120.00'),
          CustomOrderItem(
              withquantity: false,
              isBold: true,
              detailName: AppString.shipping,
              price: '0.00'),
          const Divider(),
          CustomOrderItem(
              withquantity: false,
              isBold: true,
              detailName: AppString.total,
              price: '\$120.00'),
    ],
  );
}
