import '../../domain/entities/cart_item.dart';

class CartItemModel extends CartItem {
  CartItemModel({
    required super.id,
    required super.image,
    required super.title,
    required super.price,
    required super.size,
    required super.color,
    required super.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      image: json['image'],
      title: json['title'],
      price: json['price'].toDouble(),
      size: json['size'],
      color: json['color'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'price': price,
      'size': size,
      'color': color,
      'quantity': quantity,
    };
  }
}
