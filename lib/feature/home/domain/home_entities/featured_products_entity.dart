

import 'package:equatable/equatable.dart';

import '../../data/model/category_model.dart';

class FeaturedProductsEntity extends Equatable {
  int? id;
  String? title;
  String ?slug;
  int ?price;
  String? description;
  Category? category;
  List<String>? images;
  DateTime ?creationAt;
  DateTime ?updatedAt;

  FeaturedProductsEntity(
     this.id,
     this.title,
     this.slug,
     this.price,
     this.description,
     this.category,
     this.images,
     this.creationAt,
     this.updatedAt,
  );


  @override
  List<Object?> get props => [
    id,
    title,
    slug,
    price,
    description,
    category,
    images,
    creationAt,
    updatedAt,
  ];
}


