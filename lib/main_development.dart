import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';


import 'main.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>  MyApp(appconfiguration: DevelopmentConfiguration(),
    ),

  ));
}

abstract class Configuration {}

class DevelopmentConfiguration extends Configuration {}
