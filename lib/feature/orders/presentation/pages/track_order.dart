import 'package:flutter/material.dart';
import 'package:gem_store/feature/orders/presentation/pages/widgets/customAppBar.dart';

import 'package:timeline_tile/timeline_tile.dart';

class OrderTrack extends StatelessWidget {
  const OrderTrack({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orderStatus = [
      {
        "status": "Parcel is successfully delivered",
        "date": "15 May 10:20",
        "isCompleted": true
      },
      {
        "status": "Parcel is out for delivery",
        "date": "14 May 08:00",
        "isCompleted": false
      },
      {
        "status": "Parcel is received at delivery Branch",
        "date": "13 May 17:25",
        "isCompleted": false
      },
      {
        "status": "Parcel is in transit",
        "date": "13 May 07:00",
        "isCompleted": false
      },
      {
        "status": "Sender has shipped your parcel",
        "date": "12 May 14:25",
        "isCompleted": false
      },
      {
        "status": "Sender is preparing to ship your order",
        "date": "12 May 10:01",
        "isCompleted": false
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(title: "Track Order")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Delivered on ',
                          style: TextStyle(
                              color: Color(0xff4743404D),
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
                          "Tracking Number :",
                          style: TextStyle(
                              color: Color(0xff4743404D),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " IK287368838",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orderStatus.length,
                itemBuilder: (context, index) {
                  return CustomTimelineTile(
                    isFirst: index == 0,
                    isLast: index == orderStatus.length - 1,
                    isCompleted: orderStatus[index]["isCompleted"] ?? false,
                    status: orderStatus[index]["status"]!,
                    date: orderStatus[index]["date"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;

  final bool isCompleted;

  final String status;

  final String date;

  const CustomTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isCompleted,
    required this.status,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          indicatorStyle: IndicatorStyle(
              width: 25,
              height: 25,
              indicator: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xff474340),
                      width: 2,
                    ),
                  ),
                  child: isCompleted
                      ? Center(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Color(0xff474340),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        )
                      : Center(
                          child: Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Color(0xff474340),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ))),
          // afterLineStyle: LineStyle(
          //   thickness: 1,
          //   color: Color(0xff474340),
          // ),
          beforeLineStyle: LineStyle(
            thickness: 1,
            color: Color(0xff474340),
          ),
          endChild: Container(
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  status,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4743404D)),
                ),
                const SizedBox(height: 12),
              ],
            ),
          )),
    );
  }
}
