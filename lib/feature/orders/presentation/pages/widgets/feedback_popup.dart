import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/theme_data.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';

// TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.
// i arraived to 75
class FeedbackPopup extends StatelessWidget {
  final VoidCallback onDonePressed;
  const FeedbackPopup({super.key, required this.onDonePressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300.w,
        padding: 20.all,
        decoration: BoxDecoration(
          color: ColorsManger.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [kCustomBoxShadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: const BoxDecoration(
                color: ColorsManger.ratingColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
            16.vs,
            Text(
              'Thank you for your feedback!',
              style: appTheme().textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            8.vs,
            Text(
              "We appreciated your feedback. We'll use your feedback to improve your experience.",
              style: appTheme().textTheme.titleMedium!.copyWith(
                    color: Colors.black54,
                  ),
              textAlign: TextAlign.center,
            ),
            24.vs,
            ElevatedButton(
              onPressed: onDonePressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff343434),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: 40.ph + 12.pv),
              child: const Text(
                'Done',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
