import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/global/global.dart';
import '../widget/back_ground_image.dart';
import '../widget/get_started_button.dart';
import '../widget/shadow.dart';
import '../widget/sub_title.dart';
import '../widget/title.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen( {super.key});


  @override
  Widget build(BuildContext context) {



    Global.logScreenView('WelcomeScreen','WelcomeScreen');
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        const BackGroundImage(),
        const ShadowImage(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SplashTitle(),
              SizedBox(height: 10.h),
              const SubTitle(),
              SizedBox(height: 50.h),
             const  GetStartedButton(),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ],
    ));
  }
}