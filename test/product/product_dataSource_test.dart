import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/data_sources/product_data_sources.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'product_moc.mocks.dart';

void main() {
  late ProductDataSourcesImpl productDataSourcesImpl;
  late ProductDataSources productDataSources;
  late MockDio dio;

  setUp(() {
    dio = MockDio();
    productDataSourcesImpl = ProductDataSourcesImpl(dio: dio);
    productDataSources = productDataSourcesImpl;
  });

  test('getProducts test', () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: [], statusCode: 200, requestOptions: RequestOptions(path: '')));
    var result = await productDataSources.getProducts();
    expect(result, []);
  });
}
