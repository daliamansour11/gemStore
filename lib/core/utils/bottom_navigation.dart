
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gem_store/feature/home/presentation/pages/home_screen.dart';
import 'package:gem_store/feature/orders/presentation/pages/order_screen.dart';
import 'package:gem_store/feature/profile/presentation/pages/profile_screen.dart';
import 'package:gem_store/feature/search/presentation/pages/search_screen.dart';

import '../../config/theme/themeData.dart';
import '../resources/colors_manger.dart';
import '../resources/strings_manger.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _curvedIndex = 0;

  void _changeItem(int value) {
    setState(() {
      _curvedIndex = value;
    });
  }

  String changePageTitle(int index) {
    switch (index) {
      case 0:
        return AppString.home_appBar;
      case 1:
        return AppString.discover_appBar;
      case 2:
        return AppString.cart_appBar;
      case 3:
        return AppString.wishList_appBar;
      default:
        return AppString.home_appBar; // Default title
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManger.white,
        leading: const Padding(
          padding:  EdgeInsets.only(left: 32.0),
          child: ImageIcon(
            AssetImage('assets/icons/menu.png'),
            size: 1,
          ),
        ),
        title: Text(
          changePageTitle(_curvedIndex),
          style: appTheme().textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: const [
        Padding(
          padding:  EdgeInsets.only(right: 32.0),
          child: ImageIcon(
            AssetImage('assets/icons/Bell_pin.png'), // For PNG icons
            size: 24,
            ),
        ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: ColorsManger.white,
        backgroundColor: ColorsManger.white,
        color: ColorsManger.white,
        height: 50,
        items: const [
          Icon(Icons.home_outlined, size: 22, color: ColorsManger.darkGrey),
          Icon(Icons.search, size: 22, color: ColorsManger.darkGrey),
          Image(
            image: AssetImage("assets/icons/order.png"),
            width: 21,
            height: 20,
            color: ColorsManger.darkGrey,
          ),
          Icon(Icons.person, size: 22, color: ColorsManger.darkGrey),
        ],
        onTap: _changeItem,
        index: _curvedIndex,
      ),
      body: IndexedStack(
        index: _curvedIndex,
        children:  [
          HomeScreen(),
          DiscoverScreen(),
          OrderScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}