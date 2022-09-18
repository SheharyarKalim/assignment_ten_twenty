import 'package:get/get.dart';

import '../../presentation/screens/booked_seat/booked_seat.dart';
import '../../presentation/screens/dashboard/dashboard.dart';
import '../../presentation/screens/dashboard/welcome/welcome.dart';
import '../../presentation/screens/overview/overview.dart';
import '../../presentation/screens/search/search.dart';
import '../../presentation/screens/tickets/tickets.dart';
import '../../presentation/screens/video_player/video_player.dart';
import '../../presentation/screens/watch/watch.dart';

class AppRoutes {
  AppRoutes._();

  static final AppRoutes _instance = AppRoutes._();

  static AppRoutes get instance => _instance;

  final List<GetPage> pages = [
    GetPage(name: Dashboard.id, page: () => Dashboard()),
    GetPage(name: Welcome.id, page: () => const Welcome()),
    GetPage(name: Watch.id, page: () => Watch()),
    GetPage(name: Search.id, page: () => Search()),
    GetPage(name: Overview.id, page: () => Overview()),
    GetPage(name: VideoPlayerScreen.id, page: () => VideoPlayerScreen()),
    GetPage(name: Tickets.id, page: () => Tickets()),
    GetPage(name: BookedSeat.id, page: () => BookedSeat()),
  ];
}
