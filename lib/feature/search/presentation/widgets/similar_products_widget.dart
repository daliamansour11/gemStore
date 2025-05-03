
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/widget/custom_cachednetwork_image.dart';
import '../../../home/data/model/product_data.dart' as widget show products;


Widget  similarProductsWidget(String title,int price,String image){

  return   ExpansionTile(
    shape: Border.all(color: Colors.transparent),
    collapsedShape: Border.all(color: Colors.transparent),
    title:     const Text(
      AppString.similarProductStr,
      style: TextStyle(fontSize: FontSize.s18, fontWeight: FontWeight.bold),

    ),


    children: [
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 172,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Center(
                    child:
                    buildCustomNetworkImage(context, image, double.infinity, 172.h),
                  ),
                ),
              ),
              4.vs,
              Text(title,
                  style: const TextStyle(
                      fontSize: FontSize.s12, fontWeight: FontWeight.w500)),
              Text('\$ ${price}',
                  style: const TextStyle(
                      fontSize: FontSize.s14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
            ],
          );
        },
      ),
    ],
  );


}