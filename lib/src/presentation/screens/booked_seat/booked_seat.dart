import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/colors/app_colors.dart';
import '../../../config/images/app_images.dart';
import '../../../config/strings/string_keys.dart';
import '../../../config/styles/app_text_styles.dart';
import '../../ui_model/booked_seats/selected_index.dart';
import '../../widgets/booked_seat/seats_description.dart';
import '../../widgets/generic/generic_button.dart';
import '../../widgets/tickets/tickets_app_bar.dart';
import 'booked_seat_viewModel.dart';

class BookedSeat extends StatelessWidget {
  static const String id = "/BOOKED_SEAT";

  BookedSeat({Key? key}) : super(key: key);

  final bookedSeatViewModel = Get.find<BookedSeatViewModel>();

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;
    return Obx(() => Scaffold(
          appBar: ticketsAppBar(
              backOnTap: () {
                Get.back();
              },
              title: arg[0],
              subTitle: "${arg[1]} | ${arg[4]} ${arg[5]}"),
          body: Column(
            children: [
              Expanded(
                  child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: AppColors.instance.listGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: InteractiveViewer(
                  // scaleFactor: bookedSeatViewModel.scaleFactor.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      SvgPicture.asset(AppImages.instance.screen, height: 30.h),
                      SizedBox(
                        height: 8.41.h,
                      ),
                      Text("Screen", style: AppTextStyles.instance.bold8),
                      SizedBox(
                        height: 20.42.h,
                      ),
                      Column(
                          children: List.generate(
                        10,
                        (columnIndex) => Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: List.generate(
                                      24,
                                      (rowIndex) => Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              for(int i = 0; i<bookedSeatViewModel.selectedIndex.length; i++){
                                                print("${bookedSeatViewModel.selectedIndex[i].columnIndex} ${bookedSeatViewModel.selectedIndex[i].rowIndex}");

                                              }
                                              if (bookedSeatViewModel
                                                  .selectedIndex
                                                  .contains(SelectedIndex(columnIndex: columnIndex, rowIndex: rowIndex))) {
                                                bookedSeatViewModel
                                                    .selectedIndex
                                                    .remove(SelectedIndex(columnIndex: columnIndex, rowIndex: rowIndex));
                                              } else {
                                                bookedSeatViewModel
                                                    .selectedIndex
                                                    .add(SelectedIndex(columnIndex: columnIndex, rowIndex: rowIndex));
                                              }
                                            },
                                            child: SvgPicture.asset(
                                              AppImages.instance.seat,
                                              height: 5.23.h,
                                              width: 6.98.w,
                                              color: columnIndex == 9
                                                  ? bookedSeatViewModel
                                                          .selectedIndex
                                                          .contains(SelectedIndex(columnIndex: columnIndex, rowIndex: rowIndex))
                                                      ? AppColors
                                                          .instance.golden
                                                      : AppColors
                                                          .instance.purple
                                                  : bookedSeatViewModel
                                                          .selectedIndex
                                                          .contains(SelectedIndex(columnIndex: columnIndex, rowIndex: rowIndex))
                                                      ? AppColors
                                                          .instance.golden
                                                      : AppColors
                                                          .instance.liteBlue,
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                rowIndex == 5 || rowIndex == 18
                                                    ? 18.72.w
                                                    : 5.87.w,
                                          )
                                        ],
                                      ),
                                    ).toList()),
                                SizedBox(
                                  height: 8.8.h,
                                ),
                              ],
                            ),
                            Positioned(
                                left: 10,
                                child: Text(
                                  "${columnIndex + 1}".toString(),
                                  style: AppTextStyles.instance.normal7,
                                ))
                          ],
                        ),
                      ).toList())
                    ],
                  ),
                ),
              )),
              Align(
                alignment: Alignment.bottomLeft,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: AppColors.instance.white,
                  shadowColor: AppColors.instance.grey,
                  elevation: 5,
                  child: Container(
                    height: 252.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 21.w, vertical: 26.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SeatsDescription(
                          length: bookedSeatViewModel.bookedSeatsList.length,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        GenericButton(
                            height: 30.h,
                            width: 97.w,
                            color: AppColors.instance.liteGrey,
                            onPressed: () {},
                            title: Text(
                              "4/3 row",
                              style: AppTextStyles.instance.bold10.copyWith(
                                  color: AppColors.instance.titleColor,
                                  fontWeight: FontWeight.w400),
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            GenericButton(
                                height: 50.h,
                                width: 108.w,
                                color: AppColors.instance.liteGrey,
                                onPressed: () {},
                                title: Text(
                                  StringKeys.instance.totalPrice,
                                  style: AppTextStyles.instance.bold10.copyWith(
                                      color: AppColors.instance.titleColor,
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: GenericButton(
                                  height: 50.h,
                                  color: AppColors.instance.liteBlue,
                                  onPressed: () {},
                                  title: Text(
                                    StringKeys.instance.proceedToPay,
                                    style: AppTextStyles.instance.bold14,
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
