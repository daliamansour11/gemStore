import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../widegts/banner_section.dart';
import '../widegts/category_section.dart';
import '../widegts/feature_products.dart';
import '../widegts/new_collection.dart';
import '../widegts/recommended_product.dart';
import '../widegts/top_product.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBody(),
      backgroundColor: Colors.white,
      body: _homeBody()
    );
  }
  _appBarBody() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true, // Center title
      title: const Text(
        AppString.home_appBar,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset(
            ImageAssets.menu,
          )),
    );
  }

  _homeBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CategorySection(),
            SizedBox(
              height:5.h,
            ),
            const BannerSection(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const FeatureProducts(),
            SizedBox(
              height:5.h,
            ),
            const NewCollectionBanner(),
            SizedBox(
              height:5.h,
            ),
            const RecommendedProducts(),
            SizedBox(
              height:5.h,
            ),
            const TopProduct()
          ],
        ),
      ),
    );
  }
}
