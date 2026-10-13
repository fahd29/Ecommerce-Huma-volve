import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/category_entity.dart';
import '../entities/product_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getProducts([int? categoryId]);
}
