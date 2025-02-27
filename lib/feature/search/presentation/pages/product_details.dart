import 'package:flutter/material.dart';

import '../../data/model/product_model.dart';
import '../widgets/custom_bottom_appbar_widget.dart';
import '../widgets/product_details_widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product products;

  const ProductDetailsScreen({required this.products, super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:const CustomBottomAppbarWidget(),
      body: ProductDetailsWidgets(products: widget.products,),
     
    );
  }
}
