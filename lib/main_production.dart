


import 'package:flutter/material.dart';
import 'package:gem_store/main.dart';
import 'package:gem_store/main_development.dart';


void main() {
  runApp( MyApp(appconfiguration: ProductionConfiguration(),));
}
class ProductionConfiguration extends Configuration {
}