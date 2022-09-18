import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/images/app_images.dart';
import '../../../config/styles/app_text_styles.dart';
import '../../screens/booked_seat/booked_seat_viewModel.dart';

class SeatsDescription extends GetView<BookedSeatViewModel> {
  final int length;

  const SeatsDescription({Key? key, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppImages.instance.seat,
              color: controller.bookedSeatsList[0].color,
              height: 16.16.h,
              width: 17.01.w,
            ),
            SizedBox(
              width: 12.84.w,
            ),
            Text(
              controller.bookedSeatsList[0].text,
              style: AppTextStyles.instance.bold12
                  .copyWith(color: const Color(0XFF8F8F8F)),
            ),
            SizedBox(
              width: 55.65.w,
            ),
            SvgPicture.asset(
              AppImages.instance.seat,
              color: controller.bookedSeatsList[1].color,
              height: 16.16.h,
              width: 17.01.w,
            ),
            SizedBox(
              width: 12.84.w,
            ),
            Text(
              controller.bookedSeatsList[1].text,
              style: AppTextStyles.instance.bold12
                  .copyWith(color: const Color(0XFF8F8F8F)),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppImages.instance.seat,
              color: controller.bookedSeatsList[2].color,
              height: 16.16.h,
              width: 17.01.w,
            ),
            SizedBox(
              width: 12.84.w,
            ),
            Text(
              controller.bookedSeatsList[2].text,
              style: AppTextStyles.instance.bold12
                  .copyWith(color: const Color(0XFF8F8F8F)),
            ),
            SizedBox(
              width: 47.w,
            ),
            SvgPicture.asset(
              AppImages.instance.seat,
              color: controller.bookedSeatsList[3].color,
              height: 16.16.h,
              width: 17.01.w,
            ),
            SizedBox(
              width: 12.84.w,
            ),
            Text(
              controller.bookedSeatsList[3].text,
              style: AppTextStyles.instance.bold12
                  .copyWith(color: const Color(0XFF8F8F8F)),
            )
          ],
        ),
      ],
    );
  }
}
