import 'package:ecommerce_concept/core/platform/network_info.dart';
import 'package:ecommerce_concept/features/feed/data/datasources/detail_info_remote_data_source.dart';
import 'package:ecommerce_concept/features/feed/data/datasources/phone_remote_data_source.dart';
import 'package:ecommerce_concept/features/feed/data/repositories/detail_info_repository_impl.dart';
import 'package:ecommerce_concept/features/feed/data/repositories/phone_repository_impl.dart';
import 'package:ecommerce_concept/features/feed/domain/repositories/detail_info_repository.dart';
import 'package:ecommerce_concept/features/feed/domain/repositories/phone_repository.dart';
import 'package:ecommerce_concept/features/feed/domain/usecases/get_all_phones.dart';
import 'package:ecommerce_concept/features/feed/domain/usecases/get_detail_info.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/detail_info_cubit/detail_info_cubit.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

init() {
  //bloc/cubit
  sl.registerFactory(() => PhonesListCubit(getAllPhones: sl()));
  sl.registerFactory(() => DetailInfoCubit(getDetailInfo: sl()));
  //usecases
  sl.registerLazySingleton(() => GetAllPhones(sl()));
  sl.registerLazySingleton(() => GetDetailInfo(sl()));

  //repository
  sl.registerLazySingleton<PhoneRepository>(
    () => PhoneRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<DetailInfoRepository>(
    () => DetailInfoRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<PhoneRemoteDataSource>(
      () => PhoneRemoteDataSourceImpl(client: http.Client()));
  sl.registerLazySingleton<DetialInfoRemoteDataSource>(
      () => DetialInfoRemoteDataSourceImpl(client: http.Client()));
  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //external
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
