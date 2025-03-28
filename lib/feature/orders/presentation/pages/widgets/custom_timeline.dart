import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../../../config/theme/theme_data.dart';
import '../../../../../core/extentions/sizes_utils_extensions.dart';

class CustomTimelineTile extends StatelessWidget {
  // TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.
  /// i make may effort to arrive to 50 lines but until now i arrived to 80
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
      padding: 15.ph,
      child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          indicatorStyle: IndicatorStyle(
            width: 25.w,
            height: 25.h,
            indicator: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff474340),
                  width: 2.w,
                ),
              ),
              child: Center(
                child: Container(
                    margin: 2.all,
                    decoration: BoxDecoration(
                        color: const Color(0xff474340),
                        borderRadius: BorderRadius.circular(50)),
                    child: isCompleted
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          )
                        : Text('')),
              ),
            ),
          ),
          beforeLineStyle:
              const LineStyle(thickness: 1, color: Color(0xff474340)),
          endChild: Container(
            padding: 25.all,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    status,
                    style: appTheme().textTheme.titleMedium,
                  ),
                  const Spacer(),
                  Text(
                    date,
                    style: appTheme().textTheme.titleMedium,
                  ),
                  12.vs,
                ]),
          )),
    );
  }
}
