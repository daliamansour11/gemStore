import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extentions/extentions.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../Setting/presentation/pages/setting.dart';
import '../pages/profile.dart';
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
        padding: 20.pl,
        child: Column(
          children: [
            90.vs,
            Padding(
              padding:34.pl,
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
                  20.vs,
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

            100.vs,
            buildDrawerItem(context,Icons.settings, 'Settings', () {
             setState(() {
               context.pushNamed(const SettingsPage());
             });;
            }),
            buildDrawerItem(context,Icons.mail, 'Support', () {}),
            buildDrawerItem(context,Icons.info, 'About us', () {}),
            70.vs,
            const LightDarkToggle(),
          ],
        ),
      ),
    );
  }
}
