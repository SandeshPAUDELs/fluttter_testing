import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}
class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductSuccess extends ProductState {
  final List products;
  ProductSuccess({required this.products});
  @override
  List<Object> get props => [products];
}
class ProductFailure extends ProductState {
  final String error;
  ProductFailure({required this.error});
  @override
  List<Object> get props => [error];
}