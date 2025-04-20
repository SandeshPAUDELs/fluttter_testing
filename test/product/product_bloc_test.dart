import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_application_2/domain/entities/product_entities.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_state.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'product_moc.mocks.dart';


void main() {
  final mockProductUsecases = MockProductUsecases();

  final productCubit = ProductCubit(mockProductUsecases);

  group('ProductCubit', () {
    test('initial state is ProductInitial', () {
      expect(productCubit.state, isA<ProductInitial>());
    });

    
    blocTest<ProductCubit, ProductState>(
  'when FetchProductEvent is added the state should be ProductLoaded',
  build: () {
    when(mockProductUsecases.getProducts())
        .thenAnswer((_) async => []);
    return productCubit;
  },
  act: (bloc) => bloc.fetchProducts(),
  expect: () => [
    ProductLoading(),
    ProductSuccess([]),
  ],
);
  });
}