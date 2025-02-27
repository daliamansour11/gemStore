import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/theme/theme_data.dart';
import 'feature/Splash/presentation/pages/welcome_screen.dart';
import 'main_development.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appconfiguration});
  final Configuration appconfiguration;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,

      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
            title: 'Gem Store',
            debugShowCheckedModeBanner: false,
            theme:appTheme(),
            home: const WelcomeScreen());
      },
    );
  }
}
