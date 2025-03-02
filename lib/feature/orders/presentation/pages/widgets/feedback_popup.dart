import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';
// TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.

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
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Color(0xff508A7B),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Thank you for your feedback!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "We appreciated your feedback. We'll use your feedback to improve your experience.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onDonePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff343434),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
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
