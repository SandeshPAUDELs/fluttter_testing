import 'package:flutter_application_2/presentation/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/domain/usecases/product_usecases.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductUsecases productUsecases;

  ProductCubit(this.productUsecases) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      final products = await productUsecases.getProducts();
      emit(ProductSuccess(products));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }

  Future<void> fetchProductById(int id) async {
    emit(ProductLoading());
    try {
      final product = await productUsecases.getProductById(id);
      emit(ProductByIdSuccess(product));
    } catch (e) {
      emit(ProductFailure(e.toString()));
    }
  }
}
