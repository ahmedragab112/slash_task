import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductColor extends StatefulWidget {
  const ProductColor({super.key, required this.colorValue});
  final Color colorValue;

  @override
  State<ProductColor> createState() => _ProductColorState();
}

class _ProductColorState extends State<ProductColor> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        click = !click;
        setState(() {});
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: 35.w,
          minHeight: 35.h,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.colorValue,
          shape: BoxShape.circle,
        ),
        child: click
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              )
            : null,
      ),
    );
  }
}
