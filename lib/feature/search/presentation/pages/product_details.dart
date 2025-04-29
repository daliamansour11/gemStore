import 'package:flutter/material.dart';
import '../../../../../core/services/firebase_analytic.dart';
import '../../../home/domain/home_entities/featured_products_entity.dart';
import '../widgets/custom_bottom_appbar_widget.dart';
import '../widgets/product_details_widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  final FeaturedProductsEntity products;
   const ProductDetailsScreen({required this.products, super.key} );



  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {



  @override
  Widget build(BuildContext context) {
    FirebaseAnalytic.logScreenView('ProductDetailsScreen', 'ProductDetailsScreen');
    return Scaffold(
      bottomNavigationBar:const CustomBottomAppbarWidget(),
      body: ProductDetailsWidgets(products: widget.products,),
     
    );
  }
}
