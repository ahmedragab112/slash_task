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

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
                AppStrings.signUpWithYourMail,
                style: AppTextStyle.font14RegularDarkBlue
                    .copyWith(color: Colors.white),
              ),
              const VerticalSpace(40),
              CustomTextFiled(
                  hintText: 'enter your email',
                  text: 'User Email',
                  controller: cubit.singUpEmailController),
              const VerticalSpace(40),
              PasswordModual(
                controller: cubit.singUpPasswordController,
              ),
              const VerticalSpace(60),
              CustomButton(
                onTap: () async {
                  await cubit.signUp();
                },
                text: 'SignUp',
              ),
              const VerticalSpace(20),
              CustomRichText(
                text1: 'Already have an account?  ',
                text2: 'Login',
                onTap: () {
                  context.pushReplacementNamed(AppRoutes.login);
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
