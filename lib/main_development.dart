



import 'package:flutter/material.dart';
import 'package:gem_store/main.dart';

void main() {
  runApp( MyApp(appconfiguration: DevelopmentConfiguration(),));
}


abstract class Configuration{

}

class DevelopmentConfiguration extends Configuration{

}

