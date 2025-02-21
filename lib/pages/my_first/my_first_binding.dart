import 'package:get/get.dart';

import 'my_first_logic.dart';

class MyFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyFirstLogic());
  }
}
