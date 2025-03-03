import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineTile extends StatelessWidget {
  // TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.

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
                      color: const Color(0xff474340),
                      width: 2,
                    ),
                  ),
                  child: isCompleted
                      ? Center(
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: const Color(0xff474340),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  )
                      : Center(
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: const Color(0xff474340),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ))),
          // afterLineStyle: LineStyle(
          //   thickness: 1,
          //   color: Color(0xff474340),
          // ),
          beforeLineStyle: const LineStyle(
            thickness: 1,
            color: Color(0xff474340),
          ),
          endChild: Container(
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  status,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  date,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0x4743404d)),
                ),
                const SizedBox(height: 12),
              ],
            ),
          )),
    );
  }
}