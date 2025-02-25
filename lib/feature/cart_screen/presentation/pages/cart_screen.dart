import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';
import '../../data/datasources/cart_remote_data_source.dart';
import '../../data/repositories/cart_repo_impl.dart';
import '../../domain/usecases/get_cart_items.dart';
import '../cubit/cart_screen_cubit.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/checkout_section.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Move the if conditions and BlocBuilder to a separate file and import them here.
      appBar: customAppBar(title: AppString.yourCart, context: context, haveActions: false, isBackable: true
      ),
      body: BlocProvider(
        create: (context) => CartScreenCubit(
            GetCartItems(CartRepositoryImpl(CartRemoteDataSourceImpl())))
          ..fetchCart(),
        child: BlocBuilder<CartScreenCubit, CartScreenState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                  child:
                  CircularProgressIndicator()); // TODO: Make it adative loading indicator.
            } else if (state is CartLoaded) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = state.cartItems[index];
                        return CartItemWidget(item: item);
                      },
                    ),
                  ),
                  const CheckoutSection(),
                ],
              );
            } else if (state is CartError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}