import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';

Container cardImgWhishlist() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: ColorsManger.lightWhiteColor, width: 2.w),
    ),
    child: Padding(
      padding: EdgeInsets.only(
          top: AppPadding.p20.h,
          left: AppPadding.p10.w,
          right: AppPadding.p10.w),
      child: Row(
        children: [
          SizedBox(
            width: 106.w,
            height: 149.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r)),
              child: Image.asset(
                ImageAssets.onboardingLogo1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          SizedBox(
            width: 106.w,
            height: 149.h,
            child: ClipRRect(
              child: Image.asset(
                ImageAssets.onboardingLogo1,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Container(
            height: 149.h,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  width: 53.w,
                  height: 85.h,
                  child: ClipRRect(
                    child: Image.asset(
                      ImageAssets.onboardingLogo1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 53.w,
                  height: 59.h,
                  child: ClipRRect(
                    child: Image.asset(
                      ImageAssets.onboardingLogo1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 5.w),
          Container(
            height: 149.h,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  width: 53.w,
                  height: 59.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                    ),
                    child: Image.asset(
                      ImageAssets.onboardingLogo1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  width: 53.w,
                  height: 85.h,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(8.r)),
                    child: Image.asset(
                      ImageAssets.onboardingLogo1,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
