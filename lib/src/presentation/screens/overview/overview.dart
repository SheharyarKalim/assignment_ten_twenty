import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/colors/app_colors.dart';
import '../../../config/strings/string_keys.dart';
import '../../../config/styles/app_text_styles.dart';
import '../../widgets/generic/generic_button.dart';
import '../tickets/tickets.dart';
import '../video_player/video_player.dart';
import 'overview_viewModel.dart';

class Overview extends StatelessWidget {
  static const String id = "/OVERVIEW";

  Overview({Key? key}) : super(key: key);

  final overviewViewModel = Get.find<OverviewViewModel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OverviewViewModel>(
        builder: (viewModel) => Scaffold(
              body: overviewViewModel.details == null
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.instance.black,
                    ))
                  : Stack(
                      children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 438.h,
                                width: double.infinity,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "${StringKeys.instance.imagePath}${viewModel.details!.backDropPath}",
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.instance.black,
                                          value: downloadProgress.progress,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    Container(
                                      color: AppColors.instance.black
                                          .withOpacity(0.3),
                                    ),
                                    Positioned(
                                        left: 0,
                                        right: 0,
                                        bottom: 34.h,
                                        child: Column(
                                          children: [
                                            Text(
                                              viewModel.details!.title,
                                              style: AppTextStyles
                                                  .instance.bold16
                                                  .copyWith(
                                                      color: AppColors
                                                          .instance.liteWhite),
                                            ),
                                            SizedBox(
                                              height: 6.h,
                                            ),
                                            Text(
                                              "In Theatres ${viewModel.details!.releasedDate}",
                                              style: AppTextStyles
                                                  .instance.bold16
                                                  .copyWith(
                                                      color: AppColors
                                                          .instance.liteWhite),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            GenericButton(
                                              onPressed: () {
                                                Get.toNamed(Tickets.id,
                                                    arguments: [
                                                      overviewViewModel
                                                          .details!.title,
                                                      overviewViewModel
                                                          .details!.releasedDate
                                                    ]);
                                              },
                                              title: Text(
                                                StringKeys.instance.getTickets,
                                                style: AppTextStyles
                                                    .instance.bold14,
                                              ),
                                              color:
                                                  AppColors.instance.liteBlue,
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            GenericButton(
                                              onPressed: () {
                                                Get.toNamed(
                                                    VideoPlayerScreen.id,
                                                    arguments: [
                                                      overviewViewModel
                                                          .moviesList[0].key
                                                    ])!.then((value) => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
                                              },
                                              leading: Icon(
                                                Icons.play_arrow,
                                                color: AppColors.instance.white,
                                                size: 16.h,
                                              ),
                                              title: Text(
                                                StringKeys
                                                    .instance.watchTrailer,
                                                style: AppTextStyles
                                                    .instance.bold14,
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 40.w,
                                        right: 40.w,
                                        top: 27.h,
                                        bottom: 14.h),
                                    child: Text(
                                      StringKeys.instance.genres,
                                      style: AppTextStyles.instance.bold16
                                          .copyWith(color: Colors.black),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 40.w),
                                        child: Row(
                                            children: List.generate(
                                                viewModel.details!.genresModel!
                                                    .length,
                                                (index) => Row(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 40.h,
                                                          width: 100.w,
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                      .instance
                                                                      .genresColorList[
                                                                  index],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.h)),
                                                          child: FittedBox(
                                                              fit: BoxFit
                                                                  .scaleDown,
                                                              child: Text(
                                                                viewModel
                                                                    .details!
                                                                    .genresModel![
                                                                        index]
                                                                    .genresName,
                                                                style:
                                                                    AppTextStyles
                                                                        .instance
                                                                        .bold12,
                                                              )),
                                                        ),
                                                        index <
                                                                viewModel
                                                                        .details!
                                                                        .genresModel!
                                                                        .length -
                                                                    1
                                                            ? SizedBox(
                                                                width: 5.w)
                                                            : Container()
                                                      ],
                                                    ))),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 40.w,
                                        right: 40.w,
                                        top: 24.h,
                                        bottom: 15.h),
                                    child: Divider(
                                      height: 0.2,
                                      color: AppColors.instance.black,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 40.w),
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            StringKeys.instance.overview,
                                            style: AppTextStyles.instance.bold16
                                                .copyWith(color: Colors.black),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 14.h,
                                        ),
                                        Text(
                                          viewModel.details!.overview,
                                          style: AppTextStyles.instance.bold12
                                              .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppColors.instance.grey),
                                        ),
                                        SizedBox(
                                          height: 14.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 38.5.h,
                          left: 20.w,
                          right: 0,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: AppColors.instance.white,
                                  size: 15.w,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                StringKeys.instance.watch,
                                style: AppTextStyles.instance.bold16
                                    .copyWith(color: AppColors.instance.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ));
  }
}
