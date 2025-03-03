import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/bottom_navigation.dart';
import '../../../../core/widget/Custom_button.dart';

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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                const BottomNavigation()
            ));
          }, color: ColorsManger.rateColor, isFill: true,
      ),
    );
  }
}
