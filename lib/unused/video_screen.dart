import 'package:eschoolapp/unused/video_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../widget_helper/widgets_helper.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final List<String> videoURL = [
    "jRVBlON-hIc",
    "K_aR9B4tKFk",
    "HuwKlGpzqB8",
    "fy7eoMef3e8",
    "mOKmjYwfDGU",
    "mzTy40RIxDA",
    "2muobEZUalE",
    "WZQOOM2gD-k",
    "BSvnwgsdMas"
  ];
  YoutubePlayerController? _controller;

  @override
  void deactivate() {
    _controller?.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(110 - 24),
          child: MyAppBar(
              trailing: MyTextButton(
                myWidget: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
              containerHeight: 110,
              title: "Video Lecture",
              leading: MyBackButton()),
        ),
        body: SafeArea(
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: videoURL.length,
                itemBuilder: (context, index) {
                  _controller = YoutubePlayerController(
                      initialVideoId:
                          YoutubePlayer.convertUrlToId(videoURL[index])!,
                      flags: const YoutubePlayerFlags(
                          isLive: false,
                          mute: true,
                          disableDragSeek: true,
                          hideControls: true,
                          hideThumbnail: false,
                          enableCaption: false,
                          autoPlay: false));
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 10, right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoDetaileScreen(
                                url: videoURL[index],
                              ),
                            ));
                      },
                      child: MyContainer(
                        right: 5, left: 5,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.red,
                                child: YoutubePlayerBuilder(
                                    player: YoutubePlayer(
                                        // showVideoProgressIndicator: false,
                                        // controlsTimeOut: Duration.zero,
                                        controller: _controller!),
                                    builder: (context, player) {
                                      return Container(
                                        child: player,
                                      );
                                    }),
                              ),
                            ),
                            const Gap(10),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: MyTextSmall(
                                        bgColor: Colors.red.shade50,
                                        title: "Subject Name",
                                        color: HexColor('#882929'),
                                      )),
                                  const Gap(10),
                                  const MyTextSmall(
                                    title: "Beginning of freedom movement -1",
                                    maxLines: 2,
                                  ),
                                  const Gap(4),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                })));
  }
}
class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MyTextButton(
      callback: () => Navigator.pop(context),
      myWidget: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }
}
