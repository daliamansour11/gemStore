import 'package:flutter/material.dart';

import '../../../domain/entity/order_status.dart';
import 'custom_timeline.dart';

class TraceOrderWidget extends StatelessWidget {
   TraceOrderWidget({super.key});
  final List<OrderStatus> orderStatus = [
    OrderStatus(
        'Parcel is successfully delivered',
        '15 May 10:20',
        true
    ),
    OrderStatus(
        'Parcel is out for delivery',
        '14 May 08:00',
        false
    ),
    OrderStatus(
        'Parcel is received at delivery Branch',
        '13 May 17:25',
        false
    ),
    OrderStatus(
        'Parcel is in transit',
        '13 May 07:00',
        false
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Delivered on ',
                      style: TextStyle(
                          color: Color(0x4743404d),
                          fontWeight: FontWeight.bold),
                    ),
                    Text('15.05.21'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Tracking Number :',
                      style: TextStyle(
                          color: Color(0x4743404d),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' IK287368838',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
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
