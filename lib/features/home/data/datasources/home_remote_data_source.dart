import 'package:ecommerce_app_huma_volve/core/constants/api_endpoints.dart';
import 'package:ecommerce_app_huma_volve/core/network/api_client.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts([int? categoryId]);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiClient.dio.get(ApiEndpoints.categoriesEndpoint);
    final List jsonData = response.data;
    return jsonData.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<ProductModel>> getProducts([int? categoryId]) async {
    final String endpoint = (categoryId != null && categoryId > 0)
        ? "${ApiEndpoints.categoriesEndpoint}/$categoryId/${ApiEndpoints.productsEndpoint}"
        : ApiEndpoints.productsEndpoint;
    final response = await apiClient.dio.get(endpoint);
    final List jsonData = response.data;
    return jsonData.map((e) => ProductModel.fromJson(e)).toList();
  }
}
