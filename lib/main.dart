import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/theme/theme_data.dart';
import 'feature/Splash/presentation/pages/welcome_screen.dart';
import 'main_development.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key, required this.appConfiguration});
  final Configuration appConfiguration;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,

      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: analytics),
            ],
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
            title: 'Gem Store',
            debugShowCheckedModeBanner: false,
            theme:appTheme(),
            home:const  WelcomeScreen());
      },
    );
  }
}
