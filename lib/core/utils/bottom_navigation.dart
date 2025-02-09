
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gem_store/feature/home/presentation/pages/home_screen.dart';
import 'package:gem_store/feature/orders/presentation/pages/order_screen.dart';
import 'package:gem_store/feature/profile/presentation/pages/profile_screen.dart';
import 'package:gem_store/feature/search/presentation/pages/discover_screen.dart';

import '../resources/colors_manger.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}


class _BottomNavigationState extends State<BottomNavigation> {


  int _curvedIndex=0;
  _changeItem(int value){
   setState(() {
     _curvedIndex= value;

   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    bottomNavigationBar: CurvedNavigationBar(
      buttonBackgroundColor: ColorsManger.white,
      backgroundColor: ColorsManger.white,
      color: ColorsManger.white,
      height: 50,
      items:const [
        Icon(Icons.home_outlined,size: 22,color: ColorsManger.darkGrey,),
        Icon(Icons.search,size: 22,color: ColorsManger.darkGrey,),
        Image(image:AssetImage("assets/icons/order.png",),width: 21,height: 20,color: ColorsManger.darkGrey,),
        Icon(Icons.person,size: 22,color: ColorsManger.darkGrey,),
      ],

        onTap: _changeItem,
        index: _curvedIndex
    ),
      body: IndexedStack(
        index: _curvedIndex,
        children: const[
          HomeScreen(),
          DiscoverScreen(),
          OrderScreen(),
          ProfileScreen()


        ],
      ),

    );
  }
}
