import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../config/colors/app_colors.dart';
import '../../../config/images/app_images.dart';
import '../../../config/strings/string_keys.dart';
import '../../../config/styles/app_text_styles.dart';
import '../../screens/overview/overview.dart';
import '../../screens/search/search_viewModel.dart';

class CustomListTile extends GetView<SearchViewModel> {
  const CustomListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "${StringKeys.instance.topResults}: ${controller.displayList.length}",
              style: AppTextStyles.instance.bold12.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.instance.titleColor),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            height: 0.2,
            color: AppColors.instance.black,
          ),
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.displayList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.toNamed(Overview.id,
                      arguments: [controller.displayList[index].id]);
                },
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.h),
                          child: CachedNetworkImage(
                            height: 100.h,
                            width: 130.w,
                            imageUrl:
                            "${StringKeys.instance.imagePath}${controller.displayList[index].backdropPath}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                                color: AppColors.instance.black,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                        SizedBox(
                          width: 21.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.displayList[index].title,
                                style: AppTextStyles.instance.bold16.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                controller.displayList[index].popularity.toString(),
                                style: AppTextStyles.instance.bold12.copyWith(
                                    color: AppColors.instance.grey,
                                    fontWeight: FontWeight.w500),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      right: 0,
                      top: 40.h,
                      child: IconButton(
                        onPressed: (){},
                        icon: Image.asset(AppImages.instance.more, height: 4.h, width: 20.w,),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
