import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tasck_clean_architecture/core/db_helper.dart';
import 'package:tasck_clean_architecture/core/network/network_info.dart';
import 'package:tasck_clean_architecture/src/features/product/data/repositories/product_impl.dart';
import 'package:tasck_clean_architecture/src/features/product/data/sources/local/product.dart';
import 'package:tasck_clean_architecture/src/features/product/data/sources/remote/product.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/repositories/product.dart';
import 'package:tasck_clean_architecture/src/features/product/domain/use_cases/get_products.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //feature product:

  //Bloc
  sl.registerFactory(() => ProductBloc(fetchProduct: sl()));

  //UseCases
  sl.registerLazySingleton<FetchProductsUseCase>(
    () => FetchProductsUseCase(sl()),
  );

  //Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl(), sl(), sl()),
  );
  //DataSources
  sl.registerLazySingleton<ProductLocalService>(
    () => ProductLocalServiceImpl(databaseHelper: sl()),
  );
  sl.registerLazySingleton<ProductRemoteService>(
    () => ProductRemoteServiceImplWithHttp(client: sl()),
  );
  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(iternetConnectionChecker: sl()),
  );

  //External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  sl.registerLazySingleton(() => DatabaseHelper.instance);
}
