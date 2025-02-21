import 'package:get/get.dart';
import 'package:my_diary/pages/my_add/my_add_logic.dart';
import 'package:my_diary/pages/my_first/my_first_logic.dart';
import 'package:my_diary/pages/my_second/my_second_logic.dart';

import 'my_tab_logic.dart';

class MyTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTabLogic());
    Get.lazyPut(() => MyFirstLogic());
    Get.lazyPut(() => MySecondLogic());
    Get.lazyPut(() => MyAddLogic());
  }
}
