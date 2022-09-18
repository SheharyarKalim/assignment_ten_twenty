import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';


class AppTextStyles {
  AppTextStyles._();

  static final AppTextStyles _instance = AppTextStyles._();

  static AppTextStyles get instance => _instance;

  final normal14 = TextStyle(fontSize: 14.sp);
  final normal7 = TextStyle(fontSize: 7.sp, color: const Color(0XFF8F8F8F));
  final bold14 = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.instance.white);
  final bold8 = TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w500, color: const Color(0XFF8F8F8F));
  final bold10 = TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, color: AppColors.instance.grey);
  final bold12 = TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.instance.white);
  final bold16 = TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.instance.titleColor);
  final bold18 = TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.instance.white);
}
