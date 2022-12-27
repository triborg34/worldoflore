// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/constracts.dart';
import 'package:projects/controller/controller.dart';
import 'package:projects/utils/myplayer.dart';
import 'package:image_network/image_network.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Uri spotify =
      Uri.parse('https://open.spotify.com/show/0CodUhRrKKicP1G5pGAh0l');
  Uri googlepodcast = Uri.parse(
      'https://podcasts.google.com/feed/aHR0cDovL3Jzcy5jYXN0Ym94LmZtL2V2ZXJlc3QvYmJjYzNmOTU5NjY1NDZjZmIwMTNjMTQyMzI2ZjFhNTkueG1s/episode/YWxidW0tYmJjYzNmOTU5NjY1NDZjZmIwMTNjMTQyMzI2ZjFhNTktYzM0YzViNTkxMzJjNGQwMWE2OTVlMjQ0NzAwMGE3NDk?sa=X&ved=0CAgQuIEEahcKEwjIk_zg-4r8AhUAAAAAHQAAAAAQAQ');
  Uri applepodcast = Uri.parse(
      'https://podcasts.apple.com/us/podcast/world-of-lore-%D9%BE%D8%A7%D8%AF%DA%A9%D8%B3%D8%AA-%D8%AF%D9%86%DB%8C%D8%A7%DB%8C-%D9%82%D8%B5%D9%87-%D9%87%D8%A7/id1598793857');
  Uri zillink = Uri.parse('https://zil.ink/worldoflore');
  Uri castbox = Uri.parse('https://castbox.fm/channel/id4676715?country=us');
  

  @override
  void initState() {
    Get.find<AudioPlayerController>().currentindex = 0;
    // Get.find<AudioVaribales>()
    //     .player
    //     .setSourceUrl(Get.find<RsssFeed>().podmodel.first.audiourl!);
    Get.find<AudioVaribales>()
        .player
        .onDurationChanged
        .listen((Duration event) {
      setState(() {
        Get.find<AudioVaribales>().musicLength.value = event;
        print(Get.find<AudioVaribales>().musicLength.value);
      });
    });
    Get.find<AudioVaribales>().player.onPositionChanged.listen((Duration p) {
      setState(() {
        Get.find<AudioVaribales>().postion.value = p;
      });
    });
    super.initState();
  }

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double screenwidth=MediaQuery.of(context).size.width;
    // double screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
      child: Container(
        width: Get.width,
        height: Get.height,
        color: mainBackground,
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
              color: mainFrame,
              border: Border.all(width: 2, color: mainColor),
              borderRadius: BorderRadius.circular(40)),
          margin: EdgeInsets.all(screenwidth>=560 ?50 :10),
          child: Container(
            width: Get.width,
            height: Get.height,
            margin: EdgeInsets.all(screenwidth>=560 ?20 :5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: mainColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.podcasts_rounded,
                          size: 30.0,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Container(
                            child: Text(
                              "World Of Lore",
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontFamily: "monts",
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 50),
                        child: Text(
                          "سفری به دنیای قصه ها",
                          style: TextStyle(fontSize: 16),
                        )),
                    Wrap(
                      children:[ Container(
                        height: 125,
                        margin: EdgeInsets.only(top: 40, right: 20),
                        // width: Get.width,
                        decoration: BoxDecoration(
                        border: Border.all(color: mainFrame, width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                        child: ThisPlayer(
                      index: Get.find<AudioPlayerController>().currentindex,
                      thismodel: Get.find<RsssFeed>().podmodel,
                      skipornot: false,
                        ),
                      ),
                  ]),
                    MyHorizentalList(scrollController: scrollController),
                    Text(
                      "Other Platforms",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monts'),
                    ),
                    Wrap(
                      spacing: 20,
                      

                      children: [
                        GestureDetector(
                            onTap: () async {
                              if (await canLaunchUrl(spotify)) {
                                launchUrl(spotify);
                              }
                            },
                            child: Image.asset(
                              'assets/images/Spotify.png',
                              width: 100,
                              // height: 0,
                            )),
                      
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrl(googlepodcast)) {
                              launchUrl(googlepodcast);
                            }
                          },
                          child: Image.asset(
                            'assets/images/GooglePodcast.png',
                            width: 150,
                            // height: 0,
                          ),
                        ),
                      
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrl(applepodcast)) {
                              launchUrl(applepodcast);
                            }
                          },
                          child: Image.asset(
                            'assets/images/ApplePodcast.png',
                            width: 150,
                            // height: 0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrl(zillink)) {
                              launchUrl(zillink);
                            }
                          },
                          child: Image.asset(
                            'assets/images/zillink.png',
                            width: 100,
                            // height: 0,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (await canLaunchUrl(castbox)) {
                              launchUrl(castbox);
                            }
                          },
                          child: Image.asset(
                            'assets/images/castbox.png',
                            width: 100,
                            // height: 1,
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    ));
  }
}

class MyHorizentalList extends StatelessWidget {
  const MyHorizentalList({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Scrollbar(
        thumbVisibility: true,
        controller: scrollController,
        child: ListView.separated(
            shrinkWrap: true,
            addAutomaticKeepAlives: true,
            addRepaintBoundaries: true,
            addSemanticIndexes: true,
            padding: EdgeInsets.all(20),
            reverse: true,
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: 200,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Obx(() => Get.find<RsssFeed>().podmodel.isEmpty
                            ? LinearProgressIndicator(
                                color: Colors.black,
                                backgroundColor: mainColor,
                              )
                            : ImageNetwork(
                                onTap: () {
                                  Get.find<GlobalVaribales>().index = index;
                                  Get.find<GlobalVaribales>().imgurl =
                                      Get.find<RsssFeed>()
                                          .podmodel[index]
                                          .imgurl!;

                                  Get.toNamed('/detailspage');
                                },
                                onPointer: true,
                                onLoading: CircularProgressIndicator(),
                                fitWeb: BoxFitWeb.fill,
                                height: 115,
                                width: 200,
                                image: Get.find<RsssFeed>()
                                    .podmodel[index]
                                    .imgurl!,
                              )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(() => SizedBox(
                        width: 200,
                        child: Get.find<RsssFeed>().podmodel.isEmpty
                            ? LinearProgressIndicator()
                            : Text(
                                Get.find<RsssFeed>().podmodel[index].title!,
                                softWrap: true,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                    overflow: TextOverflow.clip,
                                    fontWeight: FontWeight.bold),
                              ),
                      ))
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: Get.find<RsssFeed>().podmodel.length),
      ),
    );
  }
}
