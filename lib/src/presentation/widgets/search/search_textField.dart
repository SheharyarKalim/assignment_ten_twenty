import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/colors/app_colors.dart';
import '../../../config/images/app_images.dart';
import '../../../config/styles/app_text_styles.dart';
import '../../screens/search/search_viewModel.dart';

PreferredSizeWidget searchTextField({required BuildContext context,Function()? searchOnTap, Function(String)? onChanged}) {
  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.h), borderSide: BorderSide.none);
  }
  final searchViewModel = Get.find<SearchViewModel>();

  return AppBar(
    toolbarHeight: 80.21.h,
    backgroundColor: AppColors.instance.white,
    elevation: 5,
    centerTitle: false,
    title: TextFormField(
      controller: searchViewModel.searchTextController,
      cursorColor: AppColors.instance.liteBlue,
      onTap: searchOnTap,
      onChanged: onChanged,
      autocorrect: false,
      style: AppTextStyles.instance.bold14
          .copyWith(color: AppColors.instance.black),
      decoration: InputDecoration(
          prefixIcon: Image.asset(
            AppImages.instance.searchLogo,
            color: AppColors.instance.black,
            height: 8.19.h,
            width: 8.19.w,
          ),
          suffixIcon: IconButton(
            onPressed: (){
              searchViewModel.tapped = false;
              FocusScope.of(context).unfocus();
              searchViewModel.searchTextController.clear();
            },
            icon: Image.asset(
              AppImages.instance.close,
              color: AppColors.instance.black,
              height: 30.h,
              width: 30.w,
            ),
          ),
          filled: true,
          fillColor: const Color(0XFFEFEFEF),
          border: getBorder(),
          enabled: true,
          focusedBorder: getBorder(),
          enabledBorder: getBorder()),
    ),
  );
}
