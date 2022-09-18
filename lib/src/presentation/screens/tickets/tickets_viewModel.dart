import 'package:get/get.dart';

import '../../ui_model/tickets/calendar_model.dart';

class TicketsViewModel extends GetxController {
  final RxInt selectedIndex = 1.obs;
  final RxInt selectedContainer = 0.obs;
  final RxList dates = [].obs;
  final RxList<CalendarModel> calendar = <CalendarModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDates();
  }

  getDates() {
    List<CalendarModel> myList = [
      CalendarModel(
          time: "12:30",
          cinema: "Cinetech",
          hall: "Hall 1",
          date: "19 Sep",
          fullDate: "September 19, 2022",
          price: "50",
          bonus: "2500 bonus"),
      CalendarModel(
          time: "13:30",
          cinema: "Cinetech",
          hall: "Hall 2",
          date: "19 Sep",
          fullDate: "September 19, 2022",
          price: "70",
          bonus: "3500 bonus"),
      CalendarModel(
          time: "14:30",
          cinema: "Cinetech",
          hall: "Hall 3",
          date: "19 Sep",
          fullDate: "September 19, 2022",
          price: "100",
          bonus: "5000 bonus"),
      CalendarModel(
          time: "16:30",
          cinema: "Cinetech",
          hall: "Hall 4",
          date: "19 Sep",
          fullDate: "September 19, 2022",
          price: "150",
          bonus: "6000 bonus"),
    ];

    calendar.addAll(myList);
    final list = [
      "18 Sep",
      "19 Sep",
      "20 Sep",
      "21 Sep",
      "22 Sep",
      "23 Sep",
      "24 Sep",
      "25 Sep",
      "26 Sep",
    ];
    dates.addAll(list);
  }

  updateIndex({required int index}) {
    selectedIndex.value = index;
  }

  List sendArguments(){
    return [
      Get.arguments[0],
      calendar[selectedContainer.value].fullDate,
      calendar[selectedContainer.value].price,
      calendar[selectedContainer.value].bonus,
      calendar[selectedContainer.value].time,
      calendar[selectedContainer.value].hall,
    ];
  }
}
