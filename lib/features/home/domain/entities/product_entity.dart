import 'category_entity.dart';

class ProductEntity {
  final num? id;
  final String? title;
  final String? slug;
  final num? price;
  final String? description;
  final CategoryEntity? category;
  final List<String>? images;
  final String? creationAt;
  final String? updatedAt;

  const ProductEntity({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });
}
