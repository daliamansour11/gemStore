import 'package:flutter/material.dart';

import 'main.dart';
import 'main_development.dart';

void main() {
  runApp(MyApp(
    appconfiguration: ProductionConfiguration(),
  ));
}

class ProductionConfiguration extends Configuration {}
