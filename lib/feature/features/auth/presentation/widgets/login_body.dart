import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/config/router/routes.dart';
import 'package:slash_task/core/extention/extention.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/strings/app_strings.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';
import 'package:slash_task/core/utils/widget/custom_button.dart';
import 'package:slash_task/feature/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:slash_task/feature/features/auth/presentation/widgets/custom_auth_lisner.dart';
import 'package:slash_task/feature/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:slash_task/feature/features/auth/presentation/widgets/custom_text_filed.dart';
import 'package:slash_task/feature/features/auth/presentation/widgets/password_modual.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const VerticalSpace(20),
              Text(
                AppStrings.slash,
                style: AppTextStyle.font64DarkWhiteRegular,
                textAlign: TextAlign.center,
              ),
              const VerticalSpace(20),
              Text(
                AppStrings.welcomeBack,
                style: AppTextStyle.font24WhiteSemiBold,
                textAlign: TextAlign.start,
              ),
              const VerticalSpace(8),
              Text(
                AppStrings.signinWithYourMail,
                style: AppTextStyle.font14RegularDarkBlue
                    .copyWith(color: Colors.white),
              ),
              const VerticalSpace(40),
              CustomTextFiled(
                  hintText: 'enter your email',
                  text: 'User Email',
                  controller: cubit.emailController),
              const VerticalSpace(40),
              PasswordModual(
                controller: cubit.passwordController,
              ),
              const VerticalSpace(60),
              CustomButton(
                onTap: () async {
                  await cubit.singin();
                },
                text: 'Login',
              ),
              const VerticalSpace(20),
              CustomRichText(
                text1: 'Don’t have an account?  ',
                text2: 'Create Account',
                onTap: () {
                  context.pushReplacementNamed(AppRoutes.signUp);
                },
              ),
              const CustomAuthListenr()
            ],
          ),
        )
      ],
    ).setPadding(context, horizontal: 16, vertical: 20);
  }
}
