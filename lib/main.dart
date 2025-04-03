import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/theme/theme_data.dart';
import 'configration.dart';
import 'core/services/remote_config_service.dart';
import 'feature/Setting/presentation/pages/UpdateScreen.dart';
import 'feature/Splash/presentation/pages/welcome_screen.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.appConfiguration});

  final Configuration appConfiguration;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final RemoteConfigService _remoteConfigService = RemoteConfigService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _initializeAndCheckUpdate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }
        if (snapshot.data == true) {
          return const MaterialApp(
            home: UpdateScreen(),
          );
        }

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
              theme: appTheme(),
              home: const WelcomeScreen(),
            );
          },
        );
      },
    );
  }

  Future<bool> _initializeAndCheckUpdate() async {
    await Firebase.initializeApp();
    await _remoteConfigService.initialize();
    return await _remoteConfigService.isUpdateRequired();
  }
}
