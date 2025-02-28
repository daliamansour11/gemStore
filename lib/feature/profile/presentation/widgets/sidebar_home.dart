import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extentions/extentions.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/values_manger.dart';
import '../pages/profile.dart';
import '../pages/profile_setting_screen.dart';
import 'build_drawer_item.dart';
import 'light_dark_toggle.dart';

class SidebarHomeScreen extends StatefulWidget {
  const SidebarHomeScreen({super.key});

  @override
  State<SidebarHomeScreen> createState() => _SidebarHomeScreenState();
}

class _SidebarHomeScreenState extends State<SidebarHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 293.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: AppPadding.p20.w),
        child: Column(
          children: [
            SizedBox(height: 90.h),
            Padding(
              padding: EdgeInsets.only(left: AppPadding.p34.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      context.pushNamed(const ProfileScreen());
                    },
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManger.white,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          ImageAssets.onboardingLogo1,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sunie Pham',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'sunieux@gmail.com',
                        style: TextStyle(
                          color: ColorsManger.black,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h),
            buildDrawerItem(Icons.settings, 'Settings', () {
              context.pushNamed(const ProfileSettingScreen());
            }),
            buildDrawerItem(Icons.mail, 'Support', () {}),
            buildDrawerItem(Icons.info, 'About us', () {}),
            SizedBox(height: 70.h),
            const LightDarkToggle(),
          ],
        ),
      ),
    );
  }
}
