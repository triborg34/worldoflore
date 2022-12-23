import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/bindigs/bindigs.dart';
import 'package:projects/constracts.dart';
import 'package:projects/controller/controller.dart';
import 'package:projects/pages/loadingscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getpage,
      home: SplashScreenPage(),

      debugShowCheckedModeBanner: false,
      title: "World Of Lore",
      defaultTransition: Transition.fadeIn,
      initialBinding: MyBindigs(),
      theme: ThemeData(fontFamily: 'monts'),
      onInit: () {
        Get.find<RsssFeed>().getData();


        

      },
      
    );
  }
}