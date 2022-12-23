// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:projects/models/model.dart';
import 'package:webfeed/webfeed.dart';

class AudioPlayerController extends GetxController {
  // final player = AudioPlayer().obs;
  var currentindex=0;

  var play_btn = Icons.play_arrow_outlined;
  bool playin = false;
  void changeIt() {
    // print("inja");
    if (!playin) {
      play_btn = Icons.pause_circle_outline;
      playin = true;
    } else {
      play_btn = Icons.play_arrow;
      playin = false;
    }
    update([1]);
  }
}

class AudioVaribales extends GetxController {
  AudioPlayer player = AudioPlayer();
  AudioCache cache = AudioCache();
  var postion = new Duration().obs;
  var musicLength = new Duration().obs;
  var duration = new Duration().obs;

 
}

class RsssFeed extends GetxController {
  List<PODMODEL> podmodel = <PODMODEL>[].obs;
  var url =
      "http://rss.castbox.fm/everest/bbcc3f95966546cfb013c142326f1a59.xml";

  void getData() async {
    // ignore: unused_local_variable
    var response = await Dio()
        .get(
      url,
    )
        .then((value) {
      var rssfeed = RssFeed.parse(value.data);
      for (var i in rssfeed.items!) {
        // print(i.itunes!.image!.href);
        // print(i.title);
        // print(i.enclosure!.url);
        
        podmodel.add(PODMODEL(
          desception: i.description,
            title: i.title,
            audiourl: i.enclosure!.url,
            imgurl: i.itunes!.image!.href));
      }
    });
    print(podmodel[0].title);
  }
}

class GlobalVaribales extends GetxController{
  int index=0;
  String? imgurl;
  
}


