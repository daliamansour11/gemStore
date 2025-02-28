class WishlistModel {
  final String image;
  final String name;
  final String price;
  final String? oldPrice;
  final double rating;
  final int reviews;
  WishlistModel({
    required this.image,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.reviews,
  });
  static List<WishlistModel> getWishlistItems() {
    return List.generate(
      10,
          (index) => WishlistModel(
        image: 'assets/images/profile${index + 1}.png',
        name: 'Product $index',
        price: '\$${(index + 1) * 20}.00',
        oldPrice: index % 2 == 0 ? '\$${(index + 1) * 30}.00' : null,
        rating: (4.0 + (index % 5) * 0.2),
        reviews: (30 + index * 5),
      ),
    );
  }
}