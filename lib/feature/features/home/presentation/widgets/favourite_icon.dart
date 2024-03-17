import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/extention/extention.dart';

import '../../../../../config/router/routes.dart';
import '../../../../../core/utils/color/app_color.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(AppRoutes.favourite);
        },
        child: Icon(
          Icons.favorite,
          color: AppColor.blueColor,
          size: 25.sp,
        ),
      ),
    );
  }
}
