


import 'package:flutter/material.dart';
import '../../../../core/firebase_analytics/firebase_analytic.dart';
import '../../../../core/models/product_model.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../widgets/sidebar_home.dart';
import '../../../../core/resources/values_manger.dart';
import '../widgets/wishlist_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistItems = ProductModel.products;

    FirebaseAnalytic.logScreenView('ProfileSettingScreen', 'ProfileSettingScreen');

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
