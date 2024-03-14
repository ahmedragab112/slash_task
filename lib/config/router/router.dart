import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/di/set_up.dart';
import 'package:slash_task/core/utils/constant/app_constant.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/feature/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:slash_task/feature/features/auth/presentation/pages/login.dart';
import 'package:slash_task/feature/features/auth/presentation/pages/sign_up.dart';
import 'package:slash_task/feature/features/cart/presentation/pages/cart_view.dart';
import 'package:slash_task/feature/features/deatils/presentation/manager/productdetils_cubit.dart';
import 'package:slash_task/feature/features/deatils/presentation/pages/product_details.dart';
import 'package:slash_task/feature/features/favourite/data/models/favourite_model.dart';
import 'package:slash_task/feature/features/favourite/presentation/pages/favourite.dart';
import 'package:slash_task/feature/features/home/presentation/manager/home_cubit.dart';
import 'package:slash_task/feature/features/home/presentation/pages/home.dart';

class AppRouter {
  static Route<Widget>? onGenerateRoute(RouteSettings settings) {
    int id = 0;
    FavouriteModel favouriteModel = FavouriteModel();
    if (settings.arguments is int) {
      id = settings.arguments as int? ?? 0;
    } else {
      favouriteModel =
          settings.arguments as FavouriteModel? ?? FavouriteModel();
    }
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

      case AppRoutes.favourite:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, animation, __) => Favourite(fav: favouriteModel),
          transitionDuration: AppConstant.krouteingAnimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      case AppRoutes.login:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, animation, __) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const Login(),
          ),
          transitionDuration: AppConstant.krouteingAnimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      case AppRoutes.signUp:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, animation, __) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SingUp(),
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
