import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manger.dart';
import 'wishlist_screen.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import 'profile_setting_screen.dart';

import '../../../../core/extentions/extentions.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          120.vs,
          Padding(
            padding: 40.ph,
            child: Row(
              children: [
                Container(
                  width: 68.w,
                  height: 68.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFFFFF),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      ImageAssets.profileImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
               12.hs,
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sunie Pham',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'suniuex@gmail.com',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.black),
                  iconSize: 30,
                  onPressed: () {
                    context.pushNamed(const ProfileSettingScreen());
                  },
                ),
              ],
            ),
          ),
          80.vs,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 250),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.pushNamed(const WishlistScreen());
                      },
                      child:  Padding(
                        padding:20.ph+18.pv,
                        // EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        child:const Row(
                          children: [
                            Icon(Icons.favorite, color: Colors.grey),
                            SizedBox(width: 12),
                            Text(
                              'My Wishlist',
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 0.5,
                      color: Color(0xFFE6E3E3),
                    ),
                    InkWell(
                      onTap: () => debugPrint('Logout clicked!'),
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        child: Row(
                          children: [
                            Icon(Icons.logout, color: Colors.grey),
                            SizedBox(width: 12),
                            Text(
                              'Log out',
                              style: TextStyle(fontSize: 16),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




