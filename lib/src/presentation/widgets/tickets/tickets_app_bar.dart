import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/colors/app_colors.dart';
import '../../../config/images/app_images.dart';
import '../../../config/strings/string_keys.dart';
import '../../../config/styles/app_text_styles.dart';

PreferredSizeWidget ticketsAppBar(
    {Function()? backOnTap, required String title, required String subTitle}) {
  return AppBar(
    toolbarHeight: 110.h,
    backgroundColor: AppColors.instance.white,
    elevation: 5,
    centerTitle: true,
    leading: IconButton(
      onPressed: backOnTap,
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: AppColors.instance.black,
        size: 16.h,
      ),
    ),
    flexibleSpace: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 35.h,
        ),
        Text(
          title,
          style: AppTextStyles.instance.bold16,
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          subTitle,
          style: AppTextStyles.instance.bold12
              .copyWith(color: AppColors.instance.liteBlue),
        ),
      ],
    ),
  );
}
