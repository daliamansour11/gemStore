import 'package:flutter/material.dart';

import 'main.dart';
import 'main_development.dart';

void main() {
  runApp(MyApp(
    appConfiguration: ProductionConfiguration(),
  ));
}

class ProductionConfiguration extends Configuration {}
