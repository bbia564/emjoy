import 'package:get/get.dart';

import 'my_second_logic.dart';

class MySecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MySecondLogic());
  }
}
