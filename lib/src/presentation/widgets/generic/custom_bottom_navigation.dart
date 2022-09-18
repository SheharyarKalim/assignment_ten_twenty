import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/colors/app_colors.dart';
import '../../../config/images/app_images.dart';
import '../../../config/strings/string_keys.dart';
import '../../../config/styles/app_text_styles.dart';
import '../../screens/dashboard/dashboard_viewModel.dart';
import '../../screens/watch/watch_viewModel.dart';

class CustomBottomNavigation extends GetView<DashboardViewModel> {
  final int activeIndex;

  const CustomBottomNavigation({Key? key, required this.activeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.instance.black,
          borderRadius: BorderRadius.circular(27.h)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              controller.handleBottomNavigation(index: 0);
            },
            child: navigationBarItem(
                icon: AppImages.instance.dashboardBottomNavigation,
                iconTitle: StringKeys.instance.dashboard,
                color: activeIndex == 0
                    ? AppColors.instance.white
                    : AppColors.instance.grey),
          ),
          InkWell(
            onTap: () {
              controller.handleBottomNavigation(index: 1);
              final watchViewModel = Get.find<WatchViewModel>();
              watchViewModel.isSearching = false;
            },
            child: navigationBarItem(
                icon: AppImages.instance.watchBottomNavigation,
                iconTitle: StringKeys.instance.watch,
                color: activeIndex == 1
                    ? AppColors.instance.white
                    : AppColors.instance.grey),
          ),
          InkWell(
            onTap: () {
              controller.handleBottomNavigation(index: 2);
            },
            child: navigationBarItem(
                icon: AppImages.instance.mediaLibraryBottomNavigation,
                iconTitle: StringKeys.instance.mediaLibrary,
                color: activeIndex == 2
                    ? AppColors.instance.white
                    : AppColors.instance.grey),
          ),
          InkWell(
            onTap: () {
              controller.handleBottomNavigation(index: 3);
            },
            child: navigationBarItem(
                icon: AppImages.instance.moreBottomNavigation,
                iconTitle: StringKeys.instance.more,
                color: activeIndex == 3
                    ? AppColors.instance.white
                    : AppColors.instance.grey),
          ),
        ],
      ),
    );
  }

  Column navigationBarItem(
      {required String icon, required String iconTitle, required Color color}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          height: 18.h,
          width: 18.w,
          color: color,
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(iconTitle,
            style: AppTextStyles.instance.bold10.copyWith(color: color))
      ],
    );
  }
}
