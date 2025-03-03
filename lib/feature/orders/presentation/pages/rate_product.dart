import 'package:flutter/material.dart';
import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';

import 'widgets/rate_product_widget.dart';

class RateProduct extends StatefulWidget {
  const RateProduct({super.key});

  @override
  _RateProductScreenState createState() => _RateProductScreenState();
}

class _RateProductScreenState extends State<RateProduct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppString.rateProductAppBar, context: context,  isBackable: true, haveActions: false),
      body: Padding(
        padding:  20.ph,
        child:const SingleChildScrollView(
          child: RateProductWidget()
        ),
      ),
    );
  }
}
