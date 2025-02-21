import 'package:get/get.dart';

import 'my_write_logic.dart';

class MyWriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
