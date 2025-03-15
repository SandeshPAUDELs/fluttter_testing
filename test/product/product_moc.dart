import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/data_sources/product_data_sources.dart';
import 'package:flutter_application_2/data/repository/product_repo_impl.dart';
import 'package:flutter_application_2/domain/repository/product_repo.dart';
import 'package:flutter_application_2/domain/usecases/product_usecases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([Dio, ProductDataSources, ProductRepoImpl, ProductUsecases, ProductRepo, ProductDataSourcesImpl])
void main() {

}