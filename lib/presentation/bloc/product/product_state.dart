import 'package:equatable/equatable.dart';
import 'package:flutter_application_2/domain/entities/product_entities.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}
class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductEntities> products;

  ProductSuccess(this.products);

  @override
  List<Object> get props => [products];
}
class ProductByIdSuccess extends ProductState {
  final ProductEntities product;
  ProductByIdSuccess(this.product);
}
class ProductFailure extends ProductState {
  final String error;

  ProductFailure(this.error);

  @override
  List<Object> get props => [error];
}