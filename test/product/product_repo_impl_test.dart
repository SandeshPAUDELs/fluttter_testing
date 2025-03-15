import 'package:flutter_application_2/data/repository/product_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'product_moc.mocks.dart';

void main() {
  late ProductRepoImpl productRepoImpl;
  late MockProductRepoImpl mockProductRepoImpl;

  setUp(() {
    mockProductRepoImpl = MockProductRepoImpl();
    productRepoImpl = mockProductRepoImpl;
  });


  test('repo implementation  test', () async {
    when(mockProductRepoImpl.getProducts()).thenAnswer((_) async => []);
    var result = await productRepoImpl.getProducts();
    expect(result, []);
  });
}
