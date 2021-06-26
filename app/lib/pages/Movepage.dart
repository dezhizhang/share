import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MovePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('视频播放'),
      ),
      body: MoveContent(),
    );
  }
}

class MoveContent extends StatefulWidget {
  _MoveContent createState() => _MoveContent();
}

class _MoveContent extends State<MoveContent> {
  late final videoPlayerController;
  late final chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getChewie();
  }

  getChewie() async {
    final videoPlayerController = VideoPlayerController.network(
        'http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4');
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() async {
    videoPlayerController!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Chewie(
      controller: chewieController,
    );
  }
}
