import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../cubit/shipping_screen_cubit.dart';
import '../widgets/shipping_form.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShippingScreenCubit(),
      child: Scaffold(
        appBar: customAppBar(title: AppString.checkOut, context: context, isBackable: true, haveActions: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
                child: Image.asset(ImageAssets.checkOutIcon),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0.w),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'STEP 1\n',
                        style: TextStyle(
                            color: ColorsManger.grey, fontSize: 11.sp),
                      ),
                      TextSpan(
                        text: 'Shipping',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManger.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 37.h),
              const Expanded(child: ShippingForm()),
            ],
          ),
        ),
      ),
    );
  }
}
