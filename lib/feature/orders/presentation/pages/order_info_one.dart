import 'package:flutter/material.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/firebase_analytics/firebase_analytic.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../domain/entity/order_entity.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/order_actions.dart';
import 'widgets/order_info.dart';
import 'widgets/order_status.dart';
import 'widgets/shipping_info.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  const OrderDetailsScreen({required this.order, super.key});

  @override
  Widget build(BuildContext context) {

    FirebaseAnalytic.logScreenView('OrderDetailsScreen', 'OrderDetailsScreen');

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(title: 'Order #${order.id}')),
      body: Padding(
        padding: 16.all,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderStauts(orderStatus: order.status),
              20.vs,
              OrderInfo(order: order),
              20.vs,
              const ShippingInfo(),
              50.vs,
              order.status == AppString.delivered
                  ? const FullOrderActions()
                  : const OneOrderAction(),
            ],
          ),
        ),
      ),
    );
  }
}
