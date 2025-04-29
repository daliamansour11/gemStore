import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/firebase_analytic.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/bottom_navigation.dart';
import '../../../../core/widget/Custom_button.dart';
import '../../../Auth/presentation/pages/login.dart';
import '../../../home/presentation/pages/home_screen.dart';

class OnBoardingButton extends StatefulWidget {
  const OnBoardingButton({super.key});

  @override
  State<OnBoardingButton> createState() => _OnBoardingButtonState();
}

class _OnBoardingButtonState extends State<OnBoardingButton> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 649.h,
      left: 86.w,
      child: CustomButton(
        text:AppString.shoppingNow,
        width: 210.w,
        height: 53.h,
        onPressed: () {
          FirebaseAnalytics.instance.logEvent(
            name: 'Shopping now btn_clicked',
            parameters: {
              'button_name': 'Shopping now',
            },
          );
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
          const BottomNavigation()                 )
              // LoginScreen
            );
          }, color: ColorsManger.rateColor, isFill: true,
      ),
    );
  }
}
