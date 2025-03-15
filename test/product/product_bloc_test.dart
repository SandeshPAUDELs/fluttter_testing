import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_event.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_state.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'product_moc.mocks.dart';

void main() {
  late ProductBloc productBloc;
  late MockProductUsecases mockProductUsecases;

  setUp(() {
    mockProductUsecases = MockProductUsecases();
    productBloc = ProductBloc(mockProductUsecases);
  });

  tearDown(() {
    productBloc.close();
  });

  test('initial state is ProductInitial', () {
    expect(productBloc.state, ProductInitial());
  });

  blocTest<ProductBloc, ProductState>(
    'when FetchProductEvent is added the state should be ProductLoaded',
    build: () {
      when(mockProductUsecases.getProducts())
          .thenAnswer((_) async => []);
      return productBloc;
    },
    act: (bloc) => bloc.add(FetchProducts()),
    expect: () => [ProductLoading(), ProductSuccess(products: [])],
  );
}
