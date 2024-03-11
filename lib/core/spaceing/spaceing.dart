import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.height, {super.key, this.child});
  final double height;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h, 
    child:child ,);
  }
}

class HorizantelSpace extends StatelessWidget {
  const HorizantelSpace(
    this.width, {
    super.key, this.child,
  });
  final double width;
   final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w, child: child,);
  }
}