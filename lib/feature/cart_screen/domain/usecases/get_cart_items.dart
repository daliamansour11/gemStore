import '../entities/cart_item.dart';
import '../repositories/cart_repo.dart';

class GetCartItems {
  final CartRepository repository;

  GetCartItems(this.repository);

  Future<List<CartItem>> call() {
    return repository.getCartItems();
  }
}
