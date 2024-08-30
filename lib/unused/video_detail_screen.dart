import 'package:eschoolapp/unused/video_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../widget_helper/widgets_helper.dart';

class VideoDetaileScreen extends StatefulWidget {
  final String title;
  final String url;
  const VideoDetaileScreen({
    super.key,
    this.title = "video",
    required this.url,
  });
  @override
  State<VideoDetaileScreen> createState() => _VideoDetaileScreenState();
}

class _VideoDetaileScreenState extends State<VideoDetaileScreen> {
  YoutubePlayerController? _controller;

  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  final bool _muted = false;
  final bool _isPlayerReady = false;

  void runYouTubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: const YoutubePlayerFlags(
            isLive: false, enableCaption: false, autoPlay: true));
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller!.value.isFullScreen) {
      setState(() {
        _playerState = _controller!.value.playerState;
        _videoMetaData = _controller!.metadata;
      });
    }
  }

  @override
  void initState() {
    runYouTubePlayer();
    super.initState();
  }

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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
          showVideoProgressIndicator: true,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
              colors: const ProgressBarColors(
                  handleColor: Colors.yellowAccent, playedColor: Colors.orange),
            ),
            FullScreenButton()
          ],
          controller: _controller!),
      builder: (context, player) {
        return DefaultTabController(
            length: 2,
            initialIndex: 0,
            child: Scaffold(
                backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(100 - 24),
                  child: MyAppBar(
                      trailing: MyTextButton(
                          myWidget: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VideoFullScreen(url: widget.url),
                              ));
                        },
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      )),
                      containerHeight: 90,
                      title: "Lecture 1",
                      leading: MyBackButton()),
                ),
                body: TabBarWidget(
                  topWidget: Container(
                    child: player,
                  ),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  firstTab: "Overview",
                  secondTab: "Note",
                  firstWidget: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(20),
                            MyTextBig(title: "Lecture Overview"),
                            Gap(10),
                            MyTextMedium(
                              maxLines: 200,
                              title:
                                  "Lorem ipsum dolor sit amet, consecrate disciplining elite. Aeneas ante leo, gestates oc porttitor sit amet, aliquot vitae elite. Suspense non condiment nib. Class potent tacit sociology ad littoral torque per connubial nostril, per inceptions nanosiemens. Done efficient est ut dolor premium vestibule. In incident null et incident quits. Null et qualm ac magna fugitive flavoring. In consecrate facilitates urn amputate amputate. Ut vehicular elite non veldt actor, of suspicious eros soda les. Nun temper, qualm sed pulmonary tempus, dui deque rut rum gulag, sit amet curses null fells a enum",
                            ),
                          ]),
                    ),
                  ),
                  secondWidget: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Gap(20),
                            MyTextBig(title: "Lecture Note"),
                            Gap(10),
                            MyTextMedium(
                              maxLines: 200,
                              title:
                                  "Lorem ipsum dolor sit amet, consecrate disciplining elite. Aeneas ante leo, gestates oc porttitor sit amet, aliquot vitae elite. Suspense non condiment nib. Class potent tacit sociology ad littoral torque per connubial nostril, per inceptions nanosiemens. Done efficient est ut dolor premium vestibule. In incident null et incident quits. Null et qualm ac magna fugitive flavoring. In consecrate facilitates urn amputate amputate. Ut vehicular elite non veldt actor, of suspicious eros soda les. Nun temper, qualm sed pulmonary tempus, dui deque rut rum gulag, sit amet curses null fells a enum",
                            ),
                          ]),
                    ),
                  ),
                )));
      },
    );
  }
}
class TabBarWidget extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  final Widget firstWidget;
  final Widget secondWidget;
  final TabAlignment tabAlignment;
  final bool isScrollable;
  final Widget? topWidget;

  const TabBarWidget({
    super.key,
    required this.firstTab,
    required this.secondTab,
    required this.firstWidget,
    required this.secondWidget,
    required this.tabAlignment,
    required this.isScrollable,
    this.topWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: topWidget != null ? topWidget : null,
        ),
        TabBar(
            labelStyle:
            const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            isScrollable: isScrollable,
            tabAlignment: tabAlignment,
            tabs: [
              Tab(
                text: firstTab,
                // icon: Icon(Icons.home),
              ),
              Tab(
                text: secondTab,
                // icon: Icon(Icons.home),
              ),
            ]),
        Expanded(
          child: TabBarView(children: [
            firstWidget,
            secondWidget,
          ]),
        )
      ],
    );
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
