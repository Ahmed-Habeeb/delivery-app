import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_source/local/order_local_datasource.dart';
import '../../features/home/data/data_source/remote/order_remote_datasource.dart';
import '../../features/home/data/local_database/order_database.dart';
import '../../features/home/data/repos/order_repository_impl.dart';
import '../../features/home/domain/repos/order_repository.dart';
import '../../features/home/domain/usecases/get_delivery_bills.dart';
import '../../features/home/ui/cubit/home_cubit.dart';
import '../../features/login/data/data_source/auth_remote_datasource.dart';
import '../../features/login/data/repo/auth_repository_impl.dart';
import '../../features/login/domain/repos/auth_repository.dart';
import '../../features/login/domain/usecases/check_delivery_login.dart';
import '../../features/login/ui/cubit/login_cubit.dart';
import '../api/api_client/api_client.dart';
import '../api/api_client/base_dio.dart';
import '../api/dio/dio_factory.dart';


/// Global instance of GetIt for dependency injection
final GetIt getIt = GetIt.instance;

/// Sets up the GetIt instance with the necessary dependencies
///
/// This function initializes the Dio instance and registers the
/// necessary data sources and cubits.
setupGetIt() {
  final Dio dio = DioFactory.getDio();
  getIt.registerSingleton<BaseDio>(
    ApiClient(options: dio.options, dio: dio),
  );

  _registerDataSources();
  _registerCubits();
}

/// Registers the data sources with GetIt
///
/// This function registers the implementations of the data sources
/// as lazy singletons.
_registerDataSources() {
  getIt.registerLazySingleton(() => CheckDeliveryLogin(repository: getIt()));

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(remoteDataSource: getIt()));

  // Data Sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
          () => AuthRemoteDataSourceImpl(client: getIt()));

  getIt.registerLazySingleton(() => GetDeliveryBills(repository: getIt()));
  getIt.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(
    remoteDataSource: getIt(),
    localDataSource: getIt(),
  ));
  getIt.registerLazySingleton<OrderRemoteDataSource>(
          () => OrderRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<OrderLocalDataSource>(
          () => OrderLocalDataSourceImpl(database: getIt()));
  getIt.registerLazySingleton(() => OrderDatabase.instance);

}

/// Registers the cubits with GetIt
///
/// This function registers the cubits used in the application
/// as factories.
_registerCubits() {

  getIt.registerFactory(() => AuthCubit(checkDeliveryLogin: getIt()));
  getIt.registerFactory(() => HomeCubit(getDeliveryBills: getIt()));

}
