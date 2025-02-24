import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/strings_manger.dart';
class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Stack(
        children: [
          Container(
            width: 312.w,
            height: 168.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image:
                    AssetImage(ImageAssets.banner),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Positioned Text
          Positioned(
            top: 25.h, // Adjust position
            left: 210.w, // Adjust position
            child: SizedBox(
              width: 116.w,
              height: 93.h,
              child: const Text(
                AppString.bannerText,
                style: TextStyle(
                  fontSize: 22, // Responsive font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
