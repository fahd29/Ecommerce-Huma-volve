import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/get_products_usecase.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetProductsUseCase getProductsUseCase;

  List<CategoryEntity> categories = [];
  List<ProductEntity> products = [];

  HomeCubit({
    required this.getCategoriesUseCase,
    required this.getProductsUseCase,
  }) : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(CategoriesLoading());
    final result = await getCategoriesUseCase();
    await result.fold(
      (failure) async {
        emit(CategoriesError(failure.message));
      },
      (fetchedCategories) async {
        categories = [
          const CategoryEntity(id: 0, name: "All"),
          ...fetchedCategories,
        ];
        emit(CategoriesSuccess(categories));
        await getProducts(null);
      },
    );
  }

  Future<void> getProducts(int? categoryId) async {
    emit(ProductsLoading());
    final result = await getProductsUseCase(categoryId);
    result.fold(
      (failure) {
        emit(ProductsError(failure.message));
      },
      (fetchedProducts) {
        products = fetchedProducts;
        emit(ProductsSuccess(products));
      },
    );
  }
}
