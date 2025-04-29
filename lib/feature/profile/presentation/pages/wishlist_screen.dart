import 'package:flutter/material.dart';
import '../../../../core/resources/firebase_analytic.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../../../home/domain/home_entities/featured_products_entity.dart';
import '../widgets/sidebar_home.dart';
import '../../../../core/resources/values_manger.dart';
import '../widgets/wishlist_item.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<FeaturedProductsEntity> wishlistItems = [
    ];

    FirebaseAnalytic.logScreenView('ProfileSettingScreen', 'ProfileSettingScreen');

    return Scaffold(
      drawer: const SidebarHomeScreen(),
      appBar: customAppBar(title: AppString.wishListAppBar, context: context, isBackable: false, haveActions: true),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: GridView.builder(
          itemCount: wishlistItems.length, // No need for null safety check, we initialized the list
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppSize.s8,
            mainAxisSpacing: AppSize.s8,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return WishlistItem(item: wishlistItems[index]); // No null safety required as list is initialized
          },
        ),
      ),
    );
  }
}
