import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/utils/color/app_color.dart';
import 'package:slash_task/feature/features/auth/presentation/cubit/auth_cubit.dart';

class CustomAuthListenr extends StatelessWidget {
  const CustomAuthListenr({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          Navigator.pop(context);
          context.showSnackBar(state.message);
        } else if (state is AuthSuccess) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.homeProducts, (route) => false);
        } else {
          showDialog(
            context: context,
            builder: (context) => Center(
                child: CircularProgressIndicator(
              color: AppColor.blueDark,
            )),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
