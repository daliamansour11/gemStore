import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../domain/entities/cart_item.dart';
import 'check_box_widget.dart';
import 'product_info.dart';
import 'quantity_selector.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      // TODO: Try to use ScreenUtilExtensions, I added it in extensions folder.
      margin: 16.ph + 8.pv,
      decoration: BoxDecoration(
        color: ColorsManger.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManger.grey.withOpacity(0.9),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ProductInfo(item: item),
          const QuantitySelector(),
          const CheckBoxWidget(),
        ],
      ),
    );
  }
}
