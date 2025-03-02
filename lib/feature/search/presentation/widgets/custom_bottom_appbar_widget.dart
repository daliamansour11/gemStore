import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../cart_screen/presentation/pages/cart_screen.dart';

class CustomBottomAppbarWidget extends StatelessWidget {
  const CustomBottomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Container(
        height: 77.h,
        decoration: const BoxDecoration(
          color: Color(0xff343434),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: TextButton(
          onPressed: () {
            context.pushNamed(const CartScreen());
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.orderIcon,
                    width: 24.w,
                    height: 24.h,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    AppString.addToCart,
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffFFFFFF),
                indent: 100,
                endIndent: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
