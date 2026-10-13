import '../../domain/entities/product_entity.dart';
import 'category_model.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.title,
    super.slug,
    super.price,
    super.description,
    super.category,
    super.images,
    super.creationAt,
    super.updatedAt,
  });

  factory ProductModel.fromJson(dynamic json) {
    List<String> parsedImages = [];
    if (json['images'] != null && json['images'] is List) {
      for (var item in json['images']) {
        if (item is String) {
          String cleaned = item.replaceAll(RegExp(r'[\[\]\\"]'), '').trim();
          if (cleaned.isNotEmpty) {
            parsedImages.add(cleaned);
          }
        }
      }
    }

    return ProductModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      price: json['price'],
      description: json['description'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      images: parsedImages,
      creationAt: json['creationAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'price': price,
      'description': description,
      'category': category != null && category is CategoryModel
          ? (category as CategoryModel).toJson()
          : null,
      'images': images,
      'creationAt': creationAt,
      'updatedAt': updatedAt,
    };
  }
}
