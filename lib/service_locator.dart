import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/data_sources/product_data_sources.dart';
import 'package:flutter_application_2/data/repository/product_repo_impl.dart';
import 'package:flutter_application_2/domain/repository/product_repo.dart';
import 'package:flutter_application_2/domain/usecases/product_usecases.dart';
import 'package:flutter_application_2/presentation/bloc/product/product_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void injection() {
  getIt.registerSingleton<Dio>(Dio()); 
  getIt.registerLazySingleton(() => ProductUsecases(getIt()));
  getIt.registerLazySingleton<ProductDataSources>(() => ProductDataSourcesImpl(dio: getIt()));
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(dataSources: getIt()));
  getIt.registerFactory(() => ProductCubit(getIt()));
}