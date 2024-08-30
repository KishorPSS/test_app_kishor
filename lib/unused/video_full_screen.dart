import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoFullScreen extends StatefulWidget {
  final String url;
  const VideoFullScreen({super.key, required this.url});
  //
  @override
  State<VideoFullScreen> createState() => _VideoFullScreenState();
}

class _VideoFullScreenState extends State<VideoFullScreen> {
  YoutubePlayerController? _controller;

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: const YoutubePlayerFlags());
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller!),
        builder: (context, player) {
          return Scaffold(
            body: Center(
                child: Container(
              height: double.infinity,
              color: Colors.black,
              child: player,
            )),
          );
        });
  }
}
