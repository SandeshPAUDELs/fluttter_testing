import 'package:flutter_application_2/data/data_sources/product_data_sources.dart';
import 'package:flutter_application_2/domain/entities/product_entities.dart';
import 'package:flutter_application_2/domain/repository/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductDataSources dataSources;
  ProductRepoImpl({required this.dataSources});

  @override
  Future<List<ProductEntities>> getProducts() async {
    final products = await dataSources.getProducts();
    return products
        .map(
          (prop) => ProductEntities(
            id: prop.id,
            title: prop.title,
            // price: prop.price,
            description: prop.description,
            category: prop.category,
            image: prop.image,
          ),
        )
        .toList();
  }
}
