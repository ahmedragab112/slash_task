import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNetWorkImage extends StatelessWidget {
  const CustomNetWorkImage(
      {super.key,
      required this.imagePath,
      required this.width,
      required this.height});
  final String imagePath;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
      child: CachedNetworkImage(
        imageUrl: imagePath,
        placeholder: (context, url) => const CircularProgressIndicator(),
        fit: BoxFit.fill,
        height: height,
        width: width,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
