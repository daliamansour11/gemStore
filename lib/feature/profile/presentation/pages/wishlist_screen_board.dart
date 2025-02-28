

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../../../orders/presentation/pages/widgets/customAppBar.dart';

import '../widgets/sidebar_home.dart';
import '../widgets/wishlist_item_card.dart';

class WishlistScreenBoards extends StatefulWidget {
  const WishlistScreenBoards({super.key});

  @override
  State<WishlistScreenBoards> createState() => _WishlistScreenBoardsState();
}

class _WishlistScreenBoardsState extends State<WishlistScreenBoards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SidebarHomeScreen(),
        backgroundColor: ColorsManger.lightWhiteColor,
        appBar: customAppBar(title: AppString.wishListAppBar, context: context,  isBackable: false, haveActions: true),

        body: ListView(
          children: const [
            WishlistItemCard(),
            WishlistItemCard(),
            WishlistItemCard(),
          ],
        ));
  }
}


