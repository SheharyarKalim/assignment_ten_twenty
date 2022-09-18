import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/colors/app_colors.dart';
import '../../../config/images/app_images.dart';
import '../../../config/strings/string_keys.dart';
import '../../../config/styles/app_text_styles.dart';

PreferredSizeWidget customAppBar({Function()? searchOnTap}) {
  return AppBar(
    toolbarHeight: 80.21.h,
    backgroundColor: AppColors.instance.white,
    elevation: 5,
    centerTitle: false,
    title: Text(
      StringKeys.instance.watch,
      style: AppTextStyles.instance.bold16,
    ),
    actions: [
      IconButton(
          onPressed: searchOnTap,
          icon: SvgPicture.asset(
            AppImages.instance.search,
            height: 14.25.h,
            width: 14.25.w,
          ))
    ],
  );
}
