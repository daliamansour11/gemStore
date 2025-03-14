import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../../../../core/global/global.dart';
import '../../../../core/models/product_model.dart';

import '../widgets/custom_bottom_appbar_widget.dart';
import '../widgets/product_details_widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel products;
   ProductDetailsScreen({required this.products, super.key} );


  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {



  @override
  Widget build(BuildContext context) {
    Global.logScreenView('ProductDetailsScreen', 'ProductDetailsScreen');
    return Scaffold(
      bottomNavigationBar:const CustomBottomAppbarWidget(),
      body: ProductDetailsWidgets(products: widget.products,),
     
    );
  }
}
