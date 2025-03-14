import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/global/global.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/widget/custom_rich_text.dart';
import '../../domain/entity/order_entity.dart';
import '../pages/order_info_one.dart';
import 'order_id_date.dart';
import 'quantity_and_total.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: 10.pv + 16.ph,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: ColorsManger.white,
      child: Padding(
        padding: 16.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // spacing: 10.h,
          children: [
            OrderIdDate(order: order),
            10.vs,
            CustomRichText(
                firstText: AppString.trackingNumber,
                secondText: order.trackingNumber),
            10.vs,
            QuantityAndTotal(
              quantity: order.quantity.toString(),
              subTotal: '\$${order.subtotal}',
            ),
            10.vs,
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
                  onPressed: () {

                      Global.buttonClicked('details button_clicked');
                      context.pushNamed(OrderDetailsScreen(order: order));},
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
