import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/models/product_models.dart';

abstract class ProductDataSources {
  Future<List<ProductModels>> getProducts();
  Future<ProductModels> getProductById(int id);
}

class ProductDataSourcesImpl extends ProductDataSources {
  final String baseUrl = 'https://fakestoreapi.com/products';
  final Dio dio;

  ProductDataSourcesImpl({required this.dio});
  @override
  Future<List<ProductModels>> getProducts() async {
    try {
      final response = await dio.get(baseUrl);
      final List<ProductModels> products = List<ProductModels>.from(response.data.map((model) => ProductModels.fromJson(model)));
      print('Response: ${response.data}');
      return products;
    } catch (e) {
      throw Exception(e);
    }
  }


  @override
  Future<ProductModels> getProductById(int id) async {
    try {
      final response = await dio.get('$baseUrl/$id');
      final ProductModels product = ProductModels.fromJson(response.data);
      return product;
    } catch (e) {
      throw Exception(e);
    }
  }

}



