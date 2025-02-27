import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/shipping_screen_cubit.dart';
import '../widgets/shipping_screen_widget.dart';

class ShippingScreen extends StatelessWidget {
  const ShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShippingScreenCubit(),
        child: const ShippingBody());
  }
}
