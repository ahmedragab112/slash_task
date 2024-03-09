import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/constant/app_constant.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/feature/deatils/product_details.dart';
import 'package:slash_task/feature/home/home.dart';

class AppRouter {
  static Route<Widget>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeProducts:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, animation, __) => const Home(),
          transitionDuration: AppConstant.krouteingAnimationDuration,
          transitionsBuilder: (_, animation, __, child) => ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      case AppRoutes.productDetails:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, animation, __) => const ProductDeatils(),
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
