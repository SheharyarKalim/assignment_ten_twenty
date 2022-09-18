import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'video_player_viewModel.dart';

class VideoPlayerScreen extends StatelessWidget {
  static const String id = "/VIDEO_PLAYER_SCREEN";

  VideoPlayerScreen({Key? key}) : super(key: key);

  final videoPLayerViewModel = Get.find<VideoPlayerViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: videoPLayerViewModel.videoPlayerController,
              onEnded: (metaData){
                SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) =>  Get.back());
              },
            ),
            builder: (context, player) {
              return Center(child: player);
            },
          )),
    );
  }
}
