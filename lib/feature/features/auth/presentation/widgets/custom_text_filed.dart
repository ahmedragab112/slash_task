import 'package:flutter/material.dart';
import 'package:slash_task/core/spaceing/spaceing.dart';
import 'package:slash_task/core/utils/style/app_textstyle.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.text,
      this.isObscureText = false,
      required this.controller,
      this.suffixIcon});
  final String hintText;
  final String text;
  final bool isObscureText;
  final Widget? suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTextStyle.font18BoldBlue
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
        const VerticalSpace(24),
        TextField(
          style: AppTextStyle.font18BoldBlue
              .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          controller: controller,
          obscureText: isObscureText,
          autofocus: true,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
