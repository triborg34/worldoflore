import "package:flutter/material.dart";


import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:projects/constracts.dart';
import 'package:projects/controller/controller.dart';
import 'package:projects/utils/myplayer.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
 
  @override
  void initState() {
    
    
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: mainBackground,
          ),
          Center(
            child: Container(
              width: Get.width * 0.85,
              height: Get.height * 0.85,
              decoration: BoxDecoration(
                  color: mainFrame,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: mainColor)),
              child: Column(
                children: [
                  Stack(children: [
                    Positioned(
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.425,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                            child: ImageNetwork(
                              fitWeb: BoxFitWeb.fill,
                              height: Get.height * 0.425,
                              width: Get.width * 0.85,
                              image: Get.find<GlobalVaribales>().imgurl!,
                            )),
                      ),
                    ),
                    // Positioned(
                    //     top: 200,
                    //     child: Container(
                    //       // margin: EdgeInsets.symmetric(horizontal: 0.5),
                    //       width: Get.width,
                    //       height: 170,
                    //       decoration: BoxDecoration(
                    //           gradient: LinearGradient(
                    //         begin: Alignment.bottomCenter,
                    //         end: Alignment.topCenter,
                    //         colors: [
                    //           mainFrame.withOpacity(1),
                    //           mainFrame.withOpacity(1),
                    //           mainFrame.withOpacity(1),
                    //           mainFrame.withOpacity(1),
                    //           mainFrame.withOpacity(0),
                    //           mainFrame.withOpacity(0),
                    //           mainFrame.withOpacity(0),
                    //           mainFrame.withOpacity(0),
                    //           mainFrame.withOpacity(0),
                    //           mainFrame.withOpacity(0)
                    //         ],
                    //       )),
                    //     ))
                  ]),
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(top: 40, right: 20),
                    width: Get.width,
                    decoration: BoxDecoration(
                    border: Border.all(color: mainBackground, width: 3.0),
                    borderRadius: BorderRadius.circular(10)),
                    child: ThisPlayer(
                  index: Get.find<GlobalVaribales>().index,
                  thismodel: Get.find<RsssFeed>().podmodel,
                  skipornot: false,
                    ),
                  ),
                  
                  
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
