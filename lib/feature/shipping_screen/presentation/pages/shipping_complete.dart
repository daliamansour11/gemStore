import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/global/global.dart';
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
        backgroundColor: ColorsManger.white,
        appBar: customAppBar(title: AppString.checkOut, context: context, isBackable: true, haveActions: false),

        body: Padding(
          padding: 20.ph,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: 50.ph + 30.pv,
                child: Image.asset(ImageAssets.process),
              ),
              Padding(
                padding: 32.pl,
                child: Text(
                  AppString.orderCompleted,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManger.darkGrey,
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              Center(child: Image.asset(ImageAssets.cartIcon)),
              Padding(
                padding: 55.pv + 32.ph,
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

                  Global.analytics.logEvent(
                    name: 'continueShopping button_clicked',
                    parameters: {
                      'button_name': 'Continue Shopping',
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
