import 'package:assignment/src/presentation/screens/tickets/tickets_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/colors/app_colors.dart';
import '../../../config/images/app_images.dart';
import '../../../config/strings/string_keys.dart';
import '../../../config/styles/app_text_styles.dart';
import '../../widgets/generic/generic_button.dart';
import '../../widgets/tickets/calendar.dart';
import '../../widgets/tickets/tickets_app_bar.dart';
import '../booked_seat/booked_seat.dart';

class Tickets extends StatelessWidget {
  static const String id = "/TICKETS";

  Tickets({Key? key}) : super(key: key);

  final ticketsViewModel = Get.find<TicketsViewModel>();

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;
    return Obx(() => Scaffold(
          appBar: ticketsAppBar(
              title: arg[0],
              subTitle: "In Theaters ${arg[1]}",
              backOnTap: () {
                Get.back();
              }),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: AppColors.instance.listGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 75.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    StringKeys.instance.date,
                    style: AppTextStyles.instance.bold16,
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                      children: List.generate(
                    ticketsViewModel.dates.length,
                    (index) => Row(
                      children: [
                        GenericContainer(
                            onTap: () {
                              ticketsViewModel.updateIndex(index: index);
                            },
                            activeIndex: index,
                            fillColor: true,
                            height: 40.h,
                            width: 70.w,
                            borderRadius: 10.h,
                            alignment: Alignment.center,
                            child: Text(
                              ticketsViewModel.dates[index],
                              style:
                                  index == ticketsViewModel.selectedIndex.value
                                      ? AppTextStyles.instance.bold12
                                      : AppTextStyles.instance.bold12.copyWith(
                                          color: AppColors.instance.black),
                            )),
                        index < ticketsViewModel.dates.length - 1
                            ? SizedBox(
                                width: 12.w,
                              )
                            : Container()
                      ],
                    ),
                  ).toList()),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 39.h, left: 20.w),
                    physics: const BouncingScrollPhysics(),
                    itemCount: ticketsViewModel.calendar.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ticketsViewModel.calendar[index].time,
                              style: AppTextStyles.instance.bold12
                                  .copyWith(color: AppColors.instance.black),
                            ),
                            SizedBox(
                              width: 9.w,
                            ),
                            Text(
                              "${ticketsViewModel.calendar[index].cinema} + ${ticketsViewModel.calendar[index].hall}",
                              style: AppTextStyles.instance.bold12
                                  .copyWith(color: AppColors.instance.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            GenericContainer(
                              onTap: () {
                                ticketsViewModel.selectedContainer.value = index;
                              },
                              borderRadius: 10.h,
                              height: 145.h,
                              width: 249.w,
                              activeIndex: index,
                              fillColor: false,
                              child: Image.asset(AppImages.instance.seatMap),
                            ),
                            SizedBox(
                              width: 10.w,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "From ",
                              style: AppTextStyles.instance.bold12
                                  .copyWith(color: AppColors.instance.grey),
                              children: [
                                TextSpan(
                                    text:
                                        "${ticketsViewModel.calendar[index].price}\$",
                                    style: AppTextStyles.instance.bold12
                                        .copyWith(
                                            color:
                                                AppColors.instance.titleColor,
                                            fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text: " or ",
                                    style: AppTextStyles.instance.bold12
                                        .copyWith(
                                            color: AppColors.instance.grey)),
                                TextSpan(
                                    text:
                                        ticketsViewModel.calendar[index].bonus,
                                    style: AppTextStyles.instance.bold12
                                        .copyWith(
                                            color:
                                                AppColors.instance.titleColor,
                                            fontWeight: FontWeight.w700))
                              ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: GenericButton(
              height: 50.h,
              width: 323.w,
              color: AppColors.instance.liteBlue,
              onPressed: () {
                Get.toNamed(BookedSeat.id, arguments: ticketsViewModel.sendArguments());
              },
              title: Text(
                StringKeys.instance.selectSeats,
                style: AppTextStyles.instance.bold14,
              )),
        ));
  }
}
