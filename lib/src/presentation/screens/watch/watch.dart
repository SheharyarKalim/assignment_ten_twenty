import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/colors/app_colors.dart';
import '../../widgets/generic/custom_app_bar.dart';
import '../../widgets/watch/list_cards_dashboard.dart';
import '../search/search.dart';
import '../search/search_viewModel.dart';
import 'watch_viewModel.dart';

class Watch extends StatelessWidget {
  static const String id = "/WATCH";

  Watch({Key? key}) : super(key: key);

  final watchViewModel = Get.find<WatchViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => watchViewModel.isSearching
        ? Search()
        : Scaffold(
            appBar: customAppBar(searchOnTap: () {
              watchViewModel.isSearching = true;
              final searchViewModel = Get.find<SearchViewModel>();
              searchViewModel.tapped = false;
            }),
            body: watchViewModel.moviesList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.instance.black,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: AppColors.instance.listGradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: const ListCardsDashboard())));
  }
}
