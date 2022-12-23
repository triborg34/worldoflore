import 'package:get/get.dart';
import 'package:projects/controller/controller.dart';

class MyBindigs extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => AudioPlayerController());
   Get.lazyPut(()=> AudioVaribales());
   Get.lazyPut(() => RsssFeed());
   Get.lazyPut(() => GlobalVaribales());
  }

}