import 'package:get/get.dart';
import 'package:my_diary/db_my/db_my.dart';
import 'package:my_diary/db_my/my_entity.dart';

class MyFirstLogic extends GetxController {

  DBMy dbMy = Get.find();

  var list = <MyEntity>[].obs;

  void getData() async {
    list.value = await dbMy.getMyAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
