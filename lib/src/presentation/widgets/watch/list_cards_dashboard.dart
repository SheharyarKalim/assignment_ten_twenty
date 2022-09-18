import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/strings/string_keys.dart';
import '../../screens/overview/overview.dart';
import '../../screens/watch/watch_viewModel.dart';
import '../generic/custom_card.dart';

class ListCardsDashboard extends GetView<WatchViewModel> {
  const ListCardsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      physics: const BouncingScrollPhysics(),
      itemCount: controller.moviesList.length,
      itemBuilder: (context, index) => InkWell(
        onTap: (){
          Get.toNamed(Overview.id, arguments: controller.sendArguments(index: index));
        },
        child: Column(
          children: [
            CustomCard(
              imageUrl:
                  "${StringKeys.instance.imagePath}${controller.moviesList[index].backdropPath}",
              movieName: controller.moviesList[index].title,
            ),
            index < controller.moviesList.length-1 ? SizedBox(height: 20.h) : const SizedBox()
          ],
        ),
      ),
    );
  }
}
