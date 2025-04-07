// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../../core/resources/colors_manger.dart';
import '../../../../../core/resources/font_manger.dart';

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
      // TODO: Focus On Responsive Design, check the following links:>>done

      padding: 8.pv,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(detailName,
              style: TextStyle(
                  fontSize: 14.r,
                  fontWeight: FontWeightManger.regular,
                  color: isOrderDetials ? Colors.black54 : Colors.black)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
