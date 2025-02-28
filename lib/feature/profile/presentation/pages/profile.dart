import 'package:flutter/material.dart';
import 'package:gem_store/feature/profile/presentation/pages/wishlist_screen.dart';
import '../../../../core/resources/colors_manger.dart';
import 'profile_setting_screen.dart';

import '../../../../core/extentions/extentions.dart';

class ProfileScreen extends StatelessWidget {
  // TODO: Refactor this class into smaller sections to maintain readability and keep each file, class, or function under 50 lines as recommended.
  //TODO: Make sure the profile screen is responsive and visually appealing.
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 120),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Container(
                  width: 68,
                  height: 68,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFFFFF),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
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
          const SizedBox(height: 80),
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
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        child: Row(
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


// Widget لعرض صورة المستخدم وبياناته
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFFFFF),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text(
                'Sunie Pham',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'suniuex@gmail.com',
                style: TextStyle(fontSize: 14, color: ColorsManger.grey),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: Image.asset(
              'assets/images/setting.png',
              width: 24,
              height: 24,
            ),
            iconSize: 30,
            onPressed: () {
              context.pushNamed(const ProfileSettingScreen());
            },
          ),
        ],
      ),
    );
  }
}

// Widget لعناصر القائمة
class _ProfileMenuItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            if (iconPath == 'assets/images/logout.png')
              Image.asset(
                'assets/images/arrow.png',
                width: 20,
                height: 20,
              ),
          ],
        ),
      ),
    );
  }
}
