import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors/app_colors.dart';
import '../../screens/tickets/tickets_viewModel.dart';

class GenericContainer extends GetView<TicketsViewModel> {
  final double? height, width, borderRadius;
  final AlignmentGeometry? alignment;
  final Function()? onTap;
  final Widget child;
  final int activeIndex;
  final bool? fillColor;

  const GenericContainer(
      {Key? key,
      this.onTap,
      this.height,
      this.width,
      required this.child,
      this.borderRadius,
      this.alignment,
      required this.activeIndex,
      this.fillColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          alignment: alignment,
          decoration: BoxDecoration(
              color: fillColor != false
                  ? controller.selectedIndex.value == activeIndex
                      ? AppColors.instance.liteBlue
                      : AppColors.instance.liteGrey
                  : null,
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              border: Border.all(
                  color: fillColor != false
                      ? activeIndex == controller.selectedIndex.value
                          ? AppColors.instance.liteBlue
                          : AppColors.instance.liteGrey
                      : activeIndex == controller.selectedContainer.value
                          ? AppColors.instance.liteBlue
                          : AppColors.instance.liteGrey,
                  width: 1)),
          child: child,
        )));
  }
}
