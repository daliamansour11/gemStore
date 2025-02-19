import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../../../cart_screen/presentation/widgets/custom_button.dart';
import '../cubit/shipping_screen_cubit.dart';

class ShippingComplete extends StatelessWidget {
  const ShippingComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShippingScreenCubit(),
      child: Scaffold(
        appBar: customAppBar(title: AppString.checkOut, context: context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 30.h),
                child: Image.asset(ImageAssets.process),
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.w),
                child: Text(
                  'Order Completed',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManger.darkGrey,
                  ),
                ),
              ),
              SizedBox(height: 80.h),
              Center(child: Image.asset(ImageAssets.cartIcon)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 55.h),
                child: Text(
                  AppString.thanks,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsManger.grey,
                  ),
                ),
              ),
              CustomButton(
                title: AppString.continueShopping,
                onPressed: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
