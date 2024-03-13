import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:slash_task/core/api/dio_singlton.dart';
import 'package:slash_task/core/api/web_service.dart';
import 'package:slash_task/feature/features/deatils/data/datasources/details_data_soucre_implementation.dart';
import 'package:slash_task/feature/features/deatils/data/datasources/details_data_source.dart';
import 'package:slash_task/feature/features/deatils/data/repositories/details_repo_implementation.dart';
import 'package:slash_task/feature/features/deatils/domain/repositories/deatils_repo.dart';
import 'package:slash_task/feature/features/deatils/domain/usecases/details_usecase.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/home/data/datasources/home_remote_datasource.dart';
import 'package:slash_task/feature/features/home/data/datasources/home_remotedata_soucre_implementatio.dart';
import 'package:slash_task/feature/features/home/data/repositories/home_repo_implementation.dart';
import 'package:slash_task/feature/features/home/domain/repositories/domain_repo.dart';
import 'package:slash_task/feature/features/home/domain/usecases/home_usecase.dart';
import 'package:slash_task/feature/features/home/presentation/manager/home_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiManager>(() => ApiManager(dio));

  getIt.registerLazySingleton<HomeRemoteDataSource>(() =>
      HomeRemoteDataSourceImplementation(apiManager: getIt<ApiManager>()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImplementation(
        dataSource: getIt<HomeRemoteDataSource>(),
      ));

  getIt.registerLazySingleton<HomeUseCase>(() => HomeUseCase(
        homeRepo: getIt<HomeRepo>(),
      ));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(
        useCase: getIt<HomeUseCase>(),
      ));

      //______________________________________________________________________________

 getIt.registerLazySingleton<DetailsDataSource>(() =>
    DetailsDataSourceImplementation(apiManager: getIt<ApiManager>()));

getIt.registerLazySingleton<DeatilsRepo>(() =>
    DeatilsRepoImplementation(detailsDataSource: getIt<DetailsDataSource>()));

getIt.registerLazySingleton<DetailsUseCase>(() =>
    DetailsUseCase(repo: getIt<DeatilsRepo>()));

getIt.registerFactory<ProductDetailsCubit>(() =>
    ProductDetailsCubit(useCase: getIt<DetailsUseCase>()));

}
