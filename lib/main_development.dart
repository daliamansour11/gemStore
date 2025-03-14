import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';



import 'main.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>  MyApp(appConfiguration: DevelopmentConfiguration(),
    ),

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(
      appconfiguration: DevelopmentConfiguration(),
    ),
  ));
}

abstract class Configuration {}

class DevelopmentConfiguration extends Configuration {}
