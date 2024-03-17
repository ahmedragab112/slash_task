import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/config/router/router.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/config/theme/theme.dart';
import 'package:slash_task/core/di/set_up.dart';
import 'package:slash_task/feature/features/cart/manager/cart_cubit.dart';
import 'package:slash_task/feature/features/deatils/domain/usecases/details_usecase.dart';

class Slash extends StatelessWidget {
  const Slash({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => CartCubit(useCase: getIt<DetailsUseCase>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? AppRoutes.login
              : AppRoutes.homeProducts,
        ),
      ),
    );
  }
}
