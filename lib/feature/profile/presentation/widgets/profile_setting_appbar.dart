import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';
import '../pages/profile.dart';

class ProfileSettingAppbar extends StatelessWidget {
  final String title;

  const ProfileSettingAppbar(
      {super.key, required this.title, required bool centerTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Profile Setting',
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
      ),
      centerTitle: true,
      backgroundColor: ColorsManger.white,
      leading: Padding(
        padding: EdgeInsets.only(left: AppPadding.p25.h),
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios,
              color: ColorsManger.black, size: 20.sp),
          onPressed: () {
            context.pushNamed(const ProfileScreen());
          },
        ),
      ),
    );
  }
}
