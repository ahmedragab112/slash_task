import 'package:flutter/material.dart';
import 'package:slash_task/feature/features/auth/presentation/widgets/custom_text_filed.dart';

class PasswordModual extends StatefulWidget {
  const PasswordModual({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  State<PasswordModual> createState() => _PasswordModualState();
}

class _PasswordModualState extends State<PasswordModual> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFiled(
      hintText: 'enter your name',
      text: 'Password',
      isObscureText: isObscureText,
      controller: widget.controller,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isObscureText = !isObscureText;
          });
        },
        child: isObscureText
            ? const Icon(
                Icons.visibility_off,
                color: Color(0xff808080),
              )
            : const Icon(
                Icons.visibility,
                color: Color(0xff808080),
              ),
      ),
    );
  }
}
