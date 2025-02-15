import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/cart_item.dart';
import '../../domain/usecases/get_cart_items.dart';

part 'cart_screen_state.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  final GetCartItems getCartItems;
  CartScreenCubit(this.getCartItems) : super(CartScreenInitial());

  Future<void> fetchCart() async {
    emit(CartLoading());
    try {
      final cartItems = await getCartItems();
      emit(CartLoaded(cartItems));
    } catch (e) {
      emit(const CartError("Failed to load cart"));
    }
  }
}
