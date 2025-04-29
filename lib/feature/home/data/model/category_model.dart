
import '../../domain/home_entities/category_entity.dart';

class CategoryModel{
  final String icon;
  final String label;

  CategoryModel({required this.icon,required this.label});
}

class Category extends CategoryEntity {
  Category({
    required int id,
    required Name name,
    required Slug slug,
    required String image,
    required DateTime creationAt,
    required DateTime updatedAt,
  }) : super(id, name, slug, image, creationAt, updatedAt);

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: nameValues.map[json['name']]??Name.CLOTHES,
      slug: slugValues.map[json['slug']]??Slug.CLOTHES,
      image: json['image'],
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

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
  SHOES,
}

final nameValues = EnumValues({
  'Clothes': Name.CLOTHES,
  'Electronics': Name.ELECTRONICS,
  'Furniture': Name.FURNITURE,
  'Miscellaneous': Name.MISCELLANEOUS,
  'RoyalsDonePost33': Name.ROYALS_DONE_POST33,
  'Shoes': Name.SHOES,
});

enum Slug {
  CLOTHES,
  ELECTRONICS,
  FURNITURE,
  MISCELLANEOUS,
  ROYALSDONEPOST33,
  SHOES,
}

final slugValues = EnumValues({
  'clothes': Slug.CLOTHES,
  'electronics': Slug.ELECTRONICS,
  'furniture': Slug.FURNITURE,
  'miscellaneous': Slug.MISCELLANEOUS,
  'royalsdonepost33': Slug.ROYALSDONEPOST33,
  'shoes': Slug.SHOES,
});

class EnumValues<T> {
  final Map<String, T> map;
  late final Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
