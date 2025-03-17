import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/firebase_analytics/firebase_analytic.dart';

import '../widget/back_ground_image.dart';
import '../widget/get_started_button.dart';
import '../widget/shadow.dart';
import '../widget/sub_title.dart';
import '../widget/title.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen( {super.key});


  @override
  Widget build(BuildContext context) {

    FirebaseAnalytic.logScreenView('WelcomeScreen','WelcomeScreen');
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
              10.vs,
              const SubTitle(),
             50.vs,
             const  GetStartedButton(),
              80.vs
              //for test the FirebaseCrashlytics
              // ElevatedButton(
              //   onPressed: () {
              //     FirebaseCrashlytics.instance.crash();
              //   },
              //   child: const Text("Make Me Crash"),
              // ),
            ],
          ),
        ),
      ],
    ));
  }
}
