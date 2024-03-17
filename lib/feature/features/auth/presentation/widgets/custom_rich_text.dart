import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, this.onTap, required this.text1, required this.text2});
  final Function()? onTap;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: text1,
            style: AppTextStyle.font14RegularDarkBlue
                .copyWith(color: Colors.white)),
        TextSpan(
          text: text2,
          style:
              AppTextStyle.font14RegularDarkBlue.copyWith(color: Colors.white),
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
      ]),
    );
  }
}
