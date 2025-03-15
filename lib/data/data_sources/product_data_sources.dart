import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/models/product_models.dart';

abstract class ProductDataSources {
  Future<List<ProductModels>> getProducts();
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

}