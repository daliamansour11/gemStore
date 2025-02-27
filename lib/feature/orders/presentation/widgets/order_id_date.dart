import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../domain/entity/order_entity.dart';

class OrderIdDate extends StatelessWidget {
  final Order order;
  const OrderIdDate({required this.order, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order #${order.id}',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: ColorsManger.darkGrey,
          ),
        ),
        Text(
          order.date,
          style: TextStyle(
            color: ColorsManger.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
