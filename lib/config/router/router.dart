import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/di/set_up.dart';
import 'package:slash_task/core/utils/constant/app_constant.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/feature/features/cart/presentation/pages/cart_view.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/deatils/presentation/pages/product_details.dart';
import 'package:slash_task/feature/features/home/presentation/manager/home_cubit.dart';
import 'package:slash_task/feature/features/home/presentation/pages/home.dart';

class AppRouter {
  static Route<Widget>? onGenerateRoute(RouteSettings settings) {
    final int id = settings.arguments as int? ?? 0;
    switch (settings.name) {
      case AppRoutes.homeProducts:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, animation, __) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getAllProducts(),
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
            create: (context) =>
                getIt<ProductDetailsCubit>()..getProductDetails(id: id),
            child: ProductDetails(
              id: id,
            ),
          ),
          transitionDuration: AppConstant.krouteingAnimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            scale: animation,
            child: child,
          ),
        );

      case AppRoutes.addToCart:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, animation, __) => const CartView(),
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
