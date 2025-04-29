import '../../domain/home_entities/featured_products_entity.dart';
import 'category_model.dart' show Category;

class FeaturedProductsModel extends FeaturedProductsEntity {
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;

  FeaturedProductsModel({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  }) : super(id, title, slug, price, description, category, images, creationAt, updatedAt);

  factory FeaturedProductsModel.fromJson(Map<String, dynamic> json) => FeaturedProductsModel(
    id: json['id'],
    title: json['title'],
    slug: json['slug'],
    price: json['price'],
    description: json['description'],
    category: Category.fromJson(json['category']),
    images: List<String>.from(json['images'].map((x) => x)),
    creationAt: DateTime.parse(json['creationAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'slug': slug,
    'price': price,
    'description': description,
    'category': category!.toJson(),
    'images': List<dynamic>.from(images!.map((x) => x)),
    'creationAt': creationAt!.toIso8601String(),
    'updatedAt': updatedAt!.toIso8601String(),
  };
}
