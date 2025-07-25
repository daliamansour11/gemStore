import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'configration.dart';
import 'core/services/cache_helper.dart';
import 'injection_container.dart';
import 'main.dart';
import 'service_locator.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();
  await CacheHelper.init();
  await setupServiceLocator();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(
      appConfiguration: ProductionConfiguration(),
    ),
  ));
}
