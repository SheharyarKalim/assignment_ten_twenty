import 'package:get/get.dart';

import 'presentation/screens/booked_seat/booked_seat_viewModel.dart';
import 'presentation/screens/dashboard/dashboard_viewModel.dart';
import 'presentation/screens/overview/overview_viewModel.dart';
import 'presentation/screens/search/search_viewModel.dart';
import 'presentation/screens/tickets/tickets_viewModel.dart';
import 'presentation/screens/video_player/video_player_viewModel.dart';
import 'presentation/screens/watch/watch_viewModel.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> DashboardViewModel(), fenix: true);
    Get.lazyPut(() => WatchViewModel(), fenix: true);
    Get.lazyPut(() => SearchViewModel(), fenix: true);
    Get.lazyPut(() => OverviewViewModel(), fenix: true);
    Get.lazyPut(() => VideoPlayerViewModel(), fenix: true);
    Get.lazyPut(() => TicketsViewModel(), fenix: true);
    Get.lazyPut(() => BookedSeatViewModel(), fenix: true);
  }
}
