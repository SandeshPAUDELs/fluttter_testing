import 'package:flutter_application_2/domain/repository/product_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'product_moc.mocks.dart';

void main() {
  late ProductRepo productRepo;
  late MockProductRepo mockProductRepo;

  setUp(() {
    mockProductRepo = MockProductRepo();
    productRepo = mockProductRepo;
  });

  // tearDown(){
  //   productRepo;
  // }
  test('repo test', () async {
    when(mockProductRepo.getProducts()).thenAnswer((_) async => []);
    var result = await productRepo.getProducts();
    expect(result, []);
  });

}