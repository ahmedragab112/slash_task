import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:slash_task/core/api/dio_singlton.dart';
import 'package:slash_task/core/api/web_service.dart';
import 'package:slash_task/feature/features/deatils/data/datasources/details_data_soucre_implementation.dart';
import 'package:slash_task/feature/features/deatils/data/repositories/details_repo_implementation.dart';
import 'package:slash_task/feature/features/deatils/domain/usecases/details_usecase.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/home/data/datasources/home_remotedata_soucre_implementatio.dart';
import 'package:slash_task/feature/features/home/data/repositories/home_repo_implementation.dart';
import 'package:slash_task/feature/features/home/domain/usecases/home_usecase.dart';
import 'package:slash_task/feature/features/home/presentation/manager/home_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
      .registerLazySingleton<ApiManager>(() => ApiManager(DioFactory.getDio()));

  getIt.registerLazySingleton<HomeRemoteDataSourceImplementation>(() =>
      HomeRemoteDataSourceImplementation(apiManager: getIt<ApiManager>()));

  getIt.registerLazySingleton<HomeUseCase>(() => HomeUseCase(
        homeRepo: getIt<HomeRepoImplementation>(),
      ));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(
        useCase: getIt<HomeUseCase>(),
      ));

  getIt.registerLazySingleton(() => DetailsDataSourceImplementation(
        apiManager: ApiManager(DioFactory.getDio()),
      ));

  getIt.registerLazySingleton(() => DeatilsRepoImplementation(
        detailsDataSource: getIt<DetailsDataSourceImplementation>(),
      ));

  getIt.registerLazySingleton(() => DetailsUseCase(
        repo: getIt<DeatilsRepoImplementation>(),
      ));

  getIt.registerFactory(() => ProductdetilsCubit(
        useCase: getIt<DetailsUseCase>(),
      ));
}
