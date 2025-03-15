import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/domain/usecases/product_usecases.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_event.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_state.dart';

class ProductBloc extends Bloc<ProductsEvent, ProductState>{
   ProductUsecases productUsecases;
  ProductBloc(this.productUsecases) : super(ProductInitial()){
   on<FetchProducts>((event, emit)  async {
      emit(ProductLoading());
      try {
        final products = await productUsecases.getProducts();
        emit(ProductSuccess(products: products));
      } catch (e) {
        emit(ProductFailure(error: e.toString()));
      }
   });
  }
}