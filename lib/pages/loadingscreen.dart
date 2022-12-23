import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/controller/controller.dart';
import 'package:projects/pages/home_screen.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        return Get.find<RsssFeed>().podmodel.isNotEmpty
            ? Home()
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.black,
                  ),SizedBox(height: 10,),
                  FadingText("Loading...")
                ],
              ));
      },
    ));
  }
}
