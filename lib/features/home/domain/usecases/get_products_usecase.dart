import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product_entity.dart';
import '../repositories/home_repository.dart';

class GetProductsUseCase {
  final HomeRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call([int? categoryId]) async {
    return await repository.getProducts(categoryId);
  }
}
