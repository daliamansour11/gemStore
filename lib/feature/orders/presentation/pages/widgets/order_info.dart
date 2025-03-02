import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../../../../../core/resources/strings_manger.dart';
import '../../../domain/entity/order_entity.dart';
import 'custom_order_item.dart';

class OrderInfo extends StatelessWidget {
  final Order order;
  const OrderInfo({required this.order, super.key});

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
          CustomOrderItem(
              isOrderDetials: true,
              withquantity: false,
              isBold: false,
              detailName: AppString.orderNumber,
              price: '#${order.id}'),
          10.vs,
          CustomOrderItem(
              isOrderDetials: true,
              withquantity: false,
              isBold: false,
              detailName: AppString.trackingNumber,
              price: order.trackingNumber),
          10.vs,
          CustomOrderItem(
              isOrderDetials: true,
              withquantity: false,
              isBold: false,
              detailName: AppString.deliveryAddress,
              price: order.address),
        ],
      ),
    );
  }
}
