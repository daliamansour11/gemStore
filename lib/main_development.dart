



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gem_store/main.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  runApp( MyApp(appconfiguration: DevelopmentConfiguration(),));
}


abstract class Configuration{

}

class DevelopmentConfiguration extends Configuration{

}

