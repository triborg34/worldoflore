import 'package:audioplayers/audioplayers.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:projects/controller/controller.dart';
import 'package:projects/models/model.dart';

import 'package:projects/utils/slider.dart';

// ignore: must_be_immutable
class ThisPlayer extends StatelessWidget {
  int? index;
  List<PODMODEL>? thismodel;
  bool skipornot = true;

  ThisPlayer(
      {required this.index, required this.thismodel, required this.skipornot});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Obx(() {
              return thismodel!.isEmpty
                  ? CircularProgressIndicator()
                  : Stack(
                    alignment:AlignmentDirectional.center ,
                      children: [
                        ImageNetwork(
                            onLoading: CircularProgressIndicator(),
                            fitWeb: BoxFitWeb.cover,
                            image: thismodel![index!].imgurl!,
                            height: 120,
                            width: 120),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: GetBuilder<AudioPlayerController>(
                            id: 1,
                            builder: (_) {
                              return MyButtons(
                                  myIcon: Get.find<AudioPlayerController>()
                                      .play_btn,
                                  radius: 25,
                                  function: () {
                                    Get.find<AudioPlayerController>()
                                        .changeIt();
                                    if (Get.find<AudioPlayerController>()
                                        .playin) {
                                      print(Get.find<AudioVaribales>()
                                          .musicLength
                                          .value
                                          .inSeconds);

                                      Get.find<AudioVaribales>().player.play(
                                          UrlSource(
                                              thismodel![index!].audiourl!));
                                    } else {
                                      Get.find<AudioVaribales>().postion.value =
                                          Get.find<AudioVaribales>()
                                              .musicLength
                                              .value;

                                      Get.find<AudioVaribales>().player.pause();
                                    }
                                  });
                            },
                          ),
                        ),
                      ],
                    );
            })),
        SizedBox(
          width: 10,
        ),
        Obx(() => Flexible(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Row(
                    children: [
                      Expanded(child: Obx(() {
                        return thismodel!.isEmpty
                            ? LinearProgressIndicator()
                            : Text(thismodel![index!].title!,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),
                                overflow: TextOverflow.visible);
                      })),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: slider()),
                    Obx(() => Text(
                        "${Get.find<AudioVaribales>().postion.value.inMinutes}: ${Get.find<AudioVaribales>().postion.value.inSeconds.remainder(60)}")),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ],
            )))
      ],
    );
  }
}

// ignore: must_be_immutable
class MyButtons extends StatelessWidget {
  IconData? myIcon;
  double? radius;
  var function = () {};

  MyButtons(
      {Key? key,
      required this.myIcon,
      required this.radius,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white.withOpacity(0.8),
      child: IconButton(
        iconSize: radius,
        onPressed: function,
        icon: Icon(myIcon!, color: Colors.black),
        alignment: Alignment.center,
      ),
    );
  }
}


/* 




*/