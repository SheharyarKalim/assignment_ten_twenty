import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/strings/string_keys.dart';
import '../../screens/overview/overview.dart';
import '../../screens/search/search_viewModel.dart';
import '../generic/custom_card.dart';

class GridList extends GetView<SearchViewModel> {
  const GridList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding:
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 10.w,
      children: List.generate(
          controller.searchAllList.length,
              (index) => InkWell(
                onTap: (){
                  Get.toNamed(Overview.id, arguments: controller.watchViewModel.sendArguments(index: index));
                },
                child: CustomCard(
            height: 100.h,
            width: 162.w,
            imageUrl:
            "${StringKeys.instance.imagePath}${controller.searchAllList[index].backdropPath}",
            movieName:
            controller.searchAllList[index].title,
          ),
              )),
    );
  }
}
