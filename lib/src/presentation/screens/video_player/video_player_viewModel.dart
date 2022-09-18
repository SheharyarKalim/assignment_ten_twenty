import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerViewModel extends GetxController {
  late YoutubePlayerController videoPlayerController;
  final url = "https://www.youtube.com/watch?v=";

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId("$url${Get.arguments[0]}")!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          loop: false,
        ));
    videoPlayerController.toggleFullScreenMode();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
}
