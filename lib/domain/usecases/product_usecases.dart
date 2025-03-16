import 'package:flutter_application_2/domain/entities/product_entities.dart';
import 'package:flutter_application_2/domain/repository/product_repo.dart';

class ProductUsecases {
  final ProductRepo productRepo;

  ProductUsecases(this.productRepo);

  Future<List<ProductEntities>> getProducts() async {
    return await productRepo.getProducts();
  }

  Future<ProductEntities> getProductById(int id) async {
    return await productRepo.getProductById(id);
  }
}