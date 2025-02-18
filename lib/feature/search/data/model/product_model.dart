class Product {
  final String name;
  int id;
  final double price;
  final double oldPrice;
  final String imageUrl;
  final double rating;
  final int review;
  final String description;

  Product({required this.review, required this.oldPrice,
    required this.name,
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.description,
  });
}
