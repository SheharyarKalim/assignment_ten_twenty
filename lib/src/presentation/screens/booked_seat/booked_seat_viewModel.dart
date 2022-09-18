import 'package:get/get.dart';

import '../../../config/colors/app_colors.dart';
import '../../ui_model/booked_seats/booked_seats_model.dart';
import '../../ui_model/booked_seats/selected_index.dart';

class BookedSeatViewModel extends GetxController {
  final RxList<BookedSeatsModel> bookedSeatsList = <BookedSeatsModel>[].obs;
  final RxList<SelectedIndex> selectedIndex = <SelectedIndex>[].obs;

  final RxDouble scaleFactor = 0.0.obs;

  @override
  onInit(){
    super.onInit();
    getBookedSeatsModel();
  }

  getBookedSeatsModel(){
    final vip = int.parse(Get.arguments[2]) * 3;
    final list = [
      BookedSeatsModel(color: AppColors.instance.golden, text: "Selected"),
      BookedSeatsModel(color: AppColors.instance.liteGrey, text: "Not Available"),
      BookedSeatsModel(color: AppColors.instance.purple, text: "VIP (${vip.toString()}\$)"),
      BookedSeatsModel(color: AppColors.instance.liteBlue, text: "Regular(${Get.arguments[2]}\$)"),
    ];
    bookedSeatsList.addAll(list);
  }

  increaseScaleFactor(){
    scaleFactor.value = 10;
  }
}
