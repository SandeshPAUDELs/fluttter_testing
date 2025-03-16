import 'package:flutter_application_2/domain/entities/product_entities.dart';

abstract class ProductRepo {
  Future<List<ProductEntities>> getProducts();
  Future<ProductEntities> getProductById(int id); 
}