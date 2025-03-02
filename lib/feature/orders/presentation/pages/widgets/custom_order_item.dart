// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';

class CustomOrderItem extends StatelessWidget {
  bool isOrderDetials = false;
  String detailName;
  String? quantity;
  String price;
  bool isBold = false;
  bool withquantity = true;
  CustomOrderItem({
    super.key,
    required this.detailName,
    this.quantity,
    required this.price,
    this.withquantity = true,
    this.isOrderDetials = false,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // TODO: Focus On Responsive Design, check the following links:
      //! https://docs.flutter.dev/ui/layout
      //! https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e
      //! https://docs.flutter.dev/ui/layout/constraints
      //! https://pub.dev/packages/flutter_screenutil
      padding: 8.pv,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(detailName,
              style: TextStyle(
                  color: isOrderDetials ? Colors.black54 : Colors.black)),
          Row(
            children: [
              withquantity
                  ? Text(quantity!,
                      style: const TextStyle(color: Colors.black54))
                  : const Text(''),
              10.hs,
              Text(price,
                  style: TextStyle(
                      color: ColorsManger.black,
                      fontWeight:
                          isBold ? FontWeight.bold : FontWeight.normal)),
            ],
          ),
        ],
      ),
    );
  }
}
