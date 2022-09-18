import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/generic/custom_bottom_navigation.dart';
import 'dashboard_viewModel.dart';

class Dashboard extends StatelessWidget {
  static const String id = "/DASHBOARD";

  Dashboard({Key? key}) : super(key: key);

  final dashboardViewModel = Get.find<DashboardViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: dashboardViewModel.dashboardNavigationScreens[dashboardViewModel.selectedNavigationScreenIndex],
      bottomNavigationBar: CustomBottomNavigation(activeIndex: dashboardViewModel.selectedNavigationScreenIndex),
        ));
  }
}
