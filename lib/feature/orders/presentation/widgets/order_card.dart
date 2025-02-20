import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../domain/entity/order_entity.dart';
// TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: ColorsManger.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            ),
            SizedBox(height: 8.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppString.trackingNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: ColorsManger.grey,
                    ),
                  ),
                  TextSpan(
                    text: order.trackingNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: ColorsManger.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppString.quantity,
                        style: TextStyle(
                          color: ColorsManger.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: order.quantity.toString(),
                        style: TextStyle(
                          color: ColorsManger.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppString.subtotalSign,
                        style: TextStyle(
                          color: ColorsManger.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: '\$${order.subtotal}',
                        style: TextStyle(
                          color: ColorsManger.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.status.toUpperCase(),
                  style: TextStyle(
                    color: order.color,
                    fontSize: 14.sp,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.r)),
                    side: const BorderSide(color: ColorsManger.black),
                    backgroundColor: ColorsManger.white,
                  ),
                  child: Text(
                    AppString.details,
                    style: TextStyle(
                      color: ColorsManger.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
