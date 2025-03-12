import '../resources/assets_manger.dart';

class ProductModel {
  final String name;
  int id;
  final double price;
  final double oldPrice;
  final String imageUrl;
  final double rating;
  final int review;
  final String description;

  ProductModel({
    required this.review,
    required this.oldPrice,
    required this.name,
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.description,
  });


 static List<ProductModel> products = [
    ProductModel(
      oldPrice:59.99,
      name: 'White hoodie',
      price: 29.00,
      imageUrl: ImageAssets.girlImg,
      rating: 4.5,
      description: 'A stylish fitted waist dress perfect for any occasion.', review: 65, id: 0,
    ),
    ProductModel(
      name: 'Turtleneck Sweater',
      price: 80.00,
      imageUrl:ImageAssets.girl1Img
     ,
      rating: 4.9,
      description: 'Comfortable and stylish sportswear set.', oldPrice: 99.99, review: 54, id: 1,
    ),ProductModel(
      name: 'Long Sleeve Dress',
      price: 40.00,
      imageUrl:ImageAssets.onboardingLogo1,
      rating: 4.9,
      description: 'Comfortable and stylish sportswear set.', oldPrice: 56.99, review: 48, id: 2,
    ),
  ];
}
