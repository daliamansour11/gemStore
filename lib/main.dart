import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/bottom_navigation.dart';
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

            title: 'Gem Store',

            debugShowCheckedModeBanner: false,
            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const WelcomeScreen());
      },
    );
  }
}
