import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/config/router/router.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/config/theme/theme.dart';

class Slash extends StatelessWidget {
  const Slash({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.homeProducts,
      ),
    );
  }
}
