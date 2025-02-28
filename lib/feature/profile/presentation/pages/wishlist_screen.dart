


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../../data/model/wishlist_model.dart';
import '../widgets/sidebar_home.dart';
import '../../../../core/resources/values_manger.dart';
import '../widgets/wishlist_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistItems = WishlistModel.getWishlistItems();

    return Scaffold(
      drawer: const SidebarHomeScreen(),
      appBar: customAppBar(title: AppString.wishListAppBar, context: context,  isBackable: false, haveActions: true),
      //
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: GridView.builder(
          itemCount: wishlistItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSize.s8,
            mainAxisSpacing: AppSize.s8,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return WishlistItem(item: wishlistItems[index]);
          },
        ),
      ),
    );
  }
}
