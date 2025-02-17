import '../entities/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
}
