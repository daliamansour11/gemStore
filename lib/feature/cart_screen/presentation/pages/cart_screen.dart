import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/firebase_analytic.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../../data/datasources/cart_remote_data_source.dart';
import '../../data/repositories/cart_repo_impl.dart';
import '../../domain/usecases/get_cart_items.dart';
import '../cubit/cart_screen_cubit.dart';
import 'cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen(  {super.key});


  @override
  Widget build(BuildContext context) {

    FirebaseAnalytic.logScreenView('CartScreen', 'CartScreen');
    return Scaffold(
      backgroundColor: ColorsManger.white,
      // TODO: Move the if conditions and BlocBuilder to a separate file and import them here.
      appBar: customAppBar(title: AppString.yourCart, context: context, haveActions: false, isBackable: true
      ),
      body: BlocProvider(
        create: (context) => CartScreenCubit(
            GetCartItems(CartRepositoryImpl(CartRemoteDataSourceImpl())))
          ..fetchCart(),
        child: const CartBody(),
      ),
    );
  }
}