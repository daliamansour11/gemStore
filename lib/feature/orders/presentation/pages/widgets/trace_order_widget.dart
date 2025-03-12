import 'package:flutter/material.dart';

import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/font_manger.dart';
import '../../../../../core/resources/strings_manger.dart';
import '../../../domain/entity/order_status.dart';
import 'custom_timeline.dart';

class TraceOrderWidget extends StatelessWidget {
  TraceOrderWidget({super.key});

  final List<OrderStatus> orderStatus = [
    OrderStatus('Parcel is successfully delivered', '15 May 10:20', true),
    OrderStatus('Parcel is out for delivery', '14 May 08:00', false),
    OrderStatus('Parcel is received at delivery Branch', '13 May 17:25', false),
    OrderStatus('Parcel is in transit', '13 May 07:00', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                20.vs,
                const Row(
                  children: [
                    Text(
                      AppString.deliveredOnStr,
                      style: TextStyle(
                          color: Color(0x4743404d),
                          fontSize: 12,
                          fontWeight: FontWeightManger.regular),
                    ),
                    Text('15.05.21',style: TextStyle(fontSize: 12,
                        fontWeight: FontWeightManger.regular),),
                  ],
                ),
                20.vs,
                const Row(
                  children: [
                    Text(
                      AppString.trackingNumber,
                      style: TextStyle(
                          color: Color(0x4743404d),
                          fontSize: 12,
                          fontWeight: FontWeightManger.regular),
                    ),
                    Text(
                      ' IK287368838',
                      style: TextStyle( fontSize: 12,
    fontWeight: FontWeightManger.light)),

                  ],
                ),
              ],
            ),
          ),
        ),
        50.vs,
        Expanded(
          child: ListView.builder(
            itemCount: orderStatus.length,
            itemBuilder: (context, index) {
              return CustomTimelineTile(
                isFirst: index == 0,
                isLast: index == orderStatus.length - 1,
                isCompleted: orderStatus[index].isCompleted,
                status: orderStatus[index].status,
                date: orderStatus[index].date,
              );
            },
          ),
        ),
      ],
    );
  }
}
