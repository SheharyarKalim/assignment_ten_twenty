import 'package:get/get.dart';

import '../watch/watch.dart';
import 'welcome/welcome.dart';

class DashboardViewModel extends GetxController{
  final RxInt _selectedNavigationScreenIndex = 1.obs;

  int get selectedNavigationScreenIndex => _selectedNavigationScreenIndex.value;

  set selectedNavigationScreenIndex(int value) {
    _selectedNavigationScreenIndex.value = value;
  }

  final dashboardNavigationScreens = [
    const Welcome(),
    Watch(),
    const Welcome(),
    const Welcome(),
  ];

  handleBottomNavigation({required int index}) {
    selectedNavigationScreenIndex = index;
  }
}