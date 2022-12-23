import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/controller/controller.dart';

Widget slider() {
  

  return Slider.adaptive(
    activeColor: Colors.black,
    inactiveColor: Colors.grey.shade800,
      value:Get.find<AudioVaribales>().postion.value.inSeconds.toDouble(),
      max: Get.find<AudioVaribales>().musicLength.value.inSeconds.toDouble(),
      onChanged: (value ){
        seekToSeck(value.toInt());
      });
}


void seekToSeck(int sec){
  Duration newDuriton=Duration(seconds: sec);
  Get.find<AudioVaribales>().player.seek(newDuriton);
  


}