import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "../../../features/products/bloc/products_bloc.dart";
import "../../../features/products/data/repo/base.dart";
import "../../../features/products/data/repo/impl.dart";
import "../services/api_services.dart";
import "../services/local_services.dart";

//getting instance of service locator
GetIt sl = GetIt.instance;

// registering
Future<void> slSetup() async {
  // registering blocs ...
  sl.registerFactory<ProductsBloc>(
    () => ProductsBloc(productsRepo: sl()),
  );

  // registering repos ...
  sl.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImpl(
      apiServices: sl(),
      localServices: sl(),
    ),
  );

  // registering services ...
  sl.registerLazySingleton<ApiServices>(
    () => ApiServices(dio: sl()),
  );
  sl.registerLazySingleton<LocalServices>(
    () => LocalServices(),
  );

  // registering externals ...
  sl.registerLazySingleton<Dio>(() => Dio());
}
