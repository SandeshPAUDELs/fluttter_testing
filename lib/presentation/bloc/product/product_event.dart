import 'package:equatable/equatable.dart';
abstract class ProductsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductsEvent {
  
}

class FetchProductById extends ProductsEvent {
  final int id;
  FetchProductById({required this.id});
  @override
  List<Object> get props => [id];
}