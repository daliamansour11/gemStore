import 'package:equatable/equatable.dart';

import '../../data/model/category_model.dart';

class CategoryEntity extends Equatable {
  final int id;
  final Name name;
  final Slug slug;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  CategoryEntity(
      this.id,
      this.name,
      this.slug,
      this.image,
      this.creationAt,
      this.updatedAt,
      );

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    image,
    creationAt,
    updatedAt,
  ];
}
