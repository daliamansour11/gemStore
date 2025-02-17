part of 'cart_screen_cubit.dart';

abstract class CartScreenState extends Equatable {
  const CartScreenState();

  @override
  List<Object> get props => [];
}

class CartScreenInitial extends CartScreenState {}


class CartInitial extends CartScreenState {}

class CartLoading extends CartScreenState {}

class CartLoaded extends CartScreenState {
  final List<CartItem> cartItems;
  const CartLoaded(this.cartItems);
}

class CartError extends CartScreenState {
  final String message;
  const CartError(this.message);
}
