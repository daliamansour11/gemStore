import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';

class NewCollectionBanner extends StatelessWidget {
  const NewCollectionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 424.w,
      margin: const EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        color:  ColorsManger.banner, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      padding:
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 AppString.newCollection,
                  style: TextStyle(
                      fontSize: 12.sp, color: ColorsManger.bannerText1),
                ), SizedBox(height:8.h),
                Text(
                  AppString.bannerText2,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: ColorsManger.bannerText2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/newcollection.png', // Replace with actual image path
            width: 119.w,
            height: 158.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
