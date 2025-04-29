// To parse this JSON data, do
//
//     final featuredProductsModel = featuredProductsModelFromJson(jsonString);

import 'dart:convert';

List<FeaturedProductsModel> featuredProductsModelFromJson(String str) => List<FeaturedProductsModel>.from(json.decode(str).map((x) => FeaturedProductsModel.fromJson(x)));

String featuredProductsModelToJson(List<FeaturedProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeaturedProductsModel {
  int id;
  String title;
  String slug;
  int price;
  String description;
  Category category;
  List<String> images;
  DateTime creationAt;
  DateTime updatedAt;

  FeaturedProductsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

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
    'category': category.toJson(),
    'images': List<dynamic>.from(images.map((x) => x)),
    'creationAt': creationAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

class Category {
  int id;
  Name name;
  Slug slug;
  String image;
  DateTime creationAt;
  DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'],
    name: nameValues.map[json['name']]!,
    slug: slugValues.map[json['slug']]!,
    image: json['image'],
    creationAt: DateTime.parse(json['creationAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': nameValues.reverse[name],
    'slug': slugValues.reverse[slug],
    'image': image,
    'creationAt': creationAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };
}

enum Name {
  CLOTHES,
  ELECTRONICS,
  FURNITURE,
  MISCELLANEOUS,
  ROYALS_DONE_POST33,
  SHOES
}

final nameValues = EnumValues({
  'Clothes': Name.CLOTHES,
  'Electronics': Name.ELECTRONICS,
  'Furniture': Name.FURNITURE,
  'Miscellaneous': Name.MISCELLANEOUS,
  'RoyalsDonePost33': Name.ROYALS_DONE_POST33,
  'Shoes': Name.SHOES
});

enum Slug {
  CLOTHES,
  ELECTRONICS,
  FURNITURE,
  MISCELLANEOUS,
  ROYALSDONEPOST33,
  SHOES
}

final slugValues = EnumValues({
  'clothes': Slug.CLOTHES,
  'electronics': Slug.ELECTRONICS,
  'furniture': Slug.FURNITURE,
  'miscellaneous': Slug.MISCELLANEOUS,
  'royalsdonepost33': Slug.ROYALSDONEPOST33,
  'shoes': Slug.SHOES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
