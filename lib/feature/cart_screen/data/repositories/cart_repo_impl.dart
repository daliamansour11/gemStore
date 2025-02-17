import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repo.dart';
import '../datasources/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CartItem>> getCartItems() async {
    final cartModels = await remoteDataSource.getCartItems();
    return cartModels.map((model) => model).toList();
  }
}
