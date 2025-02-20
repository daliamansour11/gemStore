import '../../../../core/resources/assets_manger.dart';
import '../models/cart_item_model.dart';

abstract class CartRemoteDataSource {
  //! I'll review this code later after working with the API.
  Future<List<CartItemModel>> getCartItems();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  @override
  Future<List<CartItemModel>> getCartItems() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      CartItemModel(
          id: '1',
          image: ImageAssets.cartImagePlaceHolder,
          title: 'Sportwear Set',
          price: 80.00,
          size: 'L',
          color: 'Cream',
          quantity: 1),
      CartItemModel(
          id: '2',
          image: ImageAssets.cartImagePlaceHolder,
          title: 'Turtleneck Sweater',
          price: 39.99,
          size: 'M',
          color: 'White',
          quantity: 1),
      CartItemModel(
          id: '3',
          image: ImageAssets.cartImagePlaceHolder,
          title: 'Cotton T-shirt',
          price: 30.00,
          size: 'L',
          color: 'Black',
          quantity: 1),
      CartItemModel(
          id: '1',
          image: ImageAssets.cartImagePlaceHolder,
          title: 'Sportwear Set',
          price: 80.00,
          size: 'L',
          color: 'Cream',
          quantity: 1),
      CartItemModel(
          id: '2',
          image: ImageAssets.cartImagePlaceHolder,
          title: 'Turtleneck Sweater',
          price: 39.99,
          size: 'M',
          color: 'White',
          quantity: 1),
    ];
  }
}
