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
  @override
  Widget build(BuildContext context) {
    //h
    // TODO: implement buildreturthrow UnimplementedError();
    return VideoView(
        'http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4');
  }
}

class VideoView extends StatefulWidget {
  final String url;
  final String? cover;
  final bool autoPlay;
  final bool looping;
  final double? aspectRatio;
  VideoView(this.url,
      {Key? key,
      this.cover,
      this.autoPlay = false,
      this.looping = false,
      this.aspectRatio = 16 / 9})
      : super(key: key);
  _VideoView createState() => _VideoView();
}

class _VideoView extends State<VideoView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: widget.aspectRatio,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 450,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
