
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../../feature/home/presentation/pages/home_screen.dart';
import '../../feature/orders/presentation/pages/order_screen.dart';
import '../../feature/profile/presentation/pages/wishlist_screen_board.dart';
import '../../feature/profile/presentation/widgets/sidebar_home.dart';
import '../../feature/search/presentation/pages/discover_full.dart';

import '../resources/colors_manger.dart';

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

  // String changePageTitle(int index) {
  //   switch (index) {
  //     case 0:
  //       return AppString.home_appBar;
  //     case 1:
  //       return AppString.discover_appBar;
  //     case 2:
  //       return AppString.cart_appBar;
  //     case 3:
  //       return AppString.wishList_appBar;
  //     default:
  //       return AppString.home_appBar; // Default title
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarHomeScreen(),

      // appBar: AppBar(
      //   backgroundColor: ColorsManger.white,
      //   leading:  Padding(
      //     padding:  EdgeInsets.only(left: 32.0),
      //     child: InkWell(
      //       onTap: (){
      //         Scaffold.of(context).openDrawer();
      //       },
      //         child: Image.asset('assets/icons/menu.png',))),
      //     // assets/icons/menu.png'
      //   title: Text(
      //     changePageTitle(_curvedIndex),
      //     style: appTheme().textTheme.bodyLarge,
      //   ),
      //   centerTitle: true,
      //   actions: const [
      //     Padding(
      //       padding:  EdgeInsets.only(right: 32.0),
      //       child: ImageIcon(
      //         AssetImage('assets/icons/Bell_pin.png'), // For PNG icons
      //         size: 24,
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: ColorsManger.white,
        backgroundColor: ColorsManger.white,
        color: ColorsManger.white,
        height: 50,
        items: const [
          Icon(Icons.home_outlined, size: 22, color: ColorsManger.darkGrey),
          Icon(Icons.search, size: 22, color: ColorsManger.darkGrey),
          Image(
            image: AssetImage('assets/icons/order.png'),
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
        children:const  [
          HomeScreen(),
          DiscoverScreen(),
          OrdersScreen(),
          WishlistScreenBoards(),
        ],
      ),
    );
  }
}