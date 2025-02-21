import 'package:get/get.dart';

import 'my_add_logic.dart';

class MyAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAddLogic());
  }
}
