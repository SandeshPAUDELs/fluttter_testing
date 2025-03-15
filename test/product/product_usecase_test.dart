import 'package:flutter_application_2/domain/usecases/product_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'product_moc.mocks.dart';

void main() {
  late ProductUsecases productUsecases;
  late MockProductRepo mockProductRepo;

  setUp(() {
    mockProductRepo = MockProductRepo();
    productUsecases = ProductUsecases(mockProductRepo);
  });

  test('use case tests', () async {
    when(mockProductRepo.getProducts()).thenAnswer((_) async => []);
    var result = await productUsecases.getProducts();
    expect(result, []);
  });
  
}