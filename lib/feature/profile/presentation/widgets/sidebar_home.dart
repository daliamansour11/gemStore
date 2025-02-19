import 'package:flutter/material.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../Setting/presentation/pages/setting.dart';
import '../pages/profile.dart';
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
      width: 293,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFE0E0),
                    ),
                    child: InkWell(
                      onTap: (){
                        context.pushNamed(const ProfileScreen());
                      },
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/تنزيل (2).jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sunie Pham',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'sunieux@gmail.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            InkWell(
                onTap: (){
                  context.pushNamed(const SettingsPage());
                },
                child: buildDrawerItem(Icons.settings, 'Setting')),
            buildDrawerItem(Icons.mail, 'Support'),
            buildDrawerItem(Icons.info, 'About us'),
            const SizedBox(height: 70),
            LightDarkToggle(),
          ],
        ),
      ),
    );
  }
}
///// Sidebar_item _Widget////////

Widget buildDrawerItem(IconData icon, String title) {
  return ListTile(
    leading: Icon(icon, color: Colors.grey[600]),
    title: Text(
      title,
      style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
    ),
    onTap: () {},
  );
}