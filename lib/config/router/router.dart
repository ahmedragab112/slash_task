import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/api/dio_singlton.dart';
import 'package:slash_task/core/api/web_service.dart';
import 'package:slash_task/core/utils/constant/app_constant.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/feature/features/deatils/data/datasources/details_data_soucre_implementation.dart';
import 'package:slash_task/feature/features/deatils/data/repositories/details_repo_implementation.dart';
import 'package:slash_task/feature/features/deatils/domain/usecases/details_usecase.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/deatils/presentation/pages/product_details.dart';
import 'package:slash_task/feature/features/home/data/datasources/home_remotedata_soucre_implementatio.dart';
import 'package:slash_task/feature/features/home/data/repositories/home_repo_implementation.dart';
import 'package:slash_task/feature/features/home/domain/usecases/home_usecase.dart';
import 'package:slash_task/feature/features/home/presentation/manager/home_cubit.dart';
import 'package:slash_task/feature/features/home/presentation/pages/home.dart';

class AppRouter {
  static Route<Widget>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeProducts:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, animation, __) => BlocProvider(
            create: (context) => HomeCubit(
                useCase: HomeUseCase(
                    homeRepo: HomeRepoImplementation(
                        dataSource: HomeRemoteDataSourceImplementation(
              apiManager: ApiManager(
                DioFactory.getDio(),
              ),
            ))))
              ..getAllProducts(),
            child: const Home(),
          ),
          transitionDuration: AppConstant.krouteingAnimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      case AppRoutes.productDetails:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, animation, __) => BlocProvider(
            create: (context) => ProductdetilsCubit(
                useCase: DetailsUseCase(
                    repo: DeatilsRepoImplementation(
              detailsDataSource: DetailsDataSourceImplementation(
                  apiManager: ApiManager(DioFactory.getDio())),
            ))),
            child: const ProductDetails(),
          ),
          transitionDuration: AppConstant.krouteingAnimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            scale: animation,
            child: child,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
