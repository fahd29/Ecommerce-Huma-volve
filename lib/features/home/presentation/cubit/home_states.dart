import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class CategoriesLoading extends HomeStates {}

class CategoriesSuccess extends HomeStates {
  final List<CategoryEntity> categories;

  CategoriesSuccess(this.categories);
}

class CategoriesError extends HomeStates {
  final String errorMessage;

  CategoriesError(this.errorMessage);
}

class ProductsLoading extends HomeStates {}

class ProductsSuccess extends HomeStates {
  final List<ProductEntity> products;

  ProductsSuccess(this.products);
}

class ProductsError extends HomeStates {
  final String errorMessage;

  ProductsError(this.errorMessage);
}
