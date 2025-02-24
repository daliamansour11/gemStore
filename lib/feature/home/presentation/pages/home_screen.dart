import 'package:flutter/material.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../widegts/banner_section.dart';
import '../widegts/category_section.dart';
import '../widegts/feature_products.dart';
import '../widegts/new_collection.dart';
import '../widegts/recommended_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: AppString.homeAppBar, context: context, isBackable: false, haveActions: false),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
            vertical: MediaQuery.of(context).size.height * 0.03
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategorySection(),
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.02 ,
              ),
              BannerSection(),
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.02 ,
              ),
              FeatureProducts(),
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.02 ,
              ),
              NewCollectionBanner(),
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.02 ,
              ),
              RecommendedProducts(),
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.02 ,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Top Products',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {}, // Add navigation or function here
                      child: const Text(
                        'Show all',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff9B9B9B)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height * 0.02 ,
              ),


            ],
          ),
        ),
      ),

    );
  }
}
