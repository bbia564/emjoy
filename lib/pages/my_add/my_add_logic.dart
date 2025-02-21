import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_diary/db_my/db_my.dart';
import 'package:my_diary/db_my/my_entity.dart';

class MyAddLogic extends GetxController {

  DBMy dbMy = Get.find();

  int type = 0;
  String content = '';

  void commit() async {
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter content');
      return;
    }
    await dbMy.insertMy(MyEntity(id: 0, createdTime: DateTime.now(), type: type, pinned: 0, pinnedTime: DateTime.now(), content: content));
    Fluttertoast.showToast(msg: 'Add successful');
    Get.back();
  }

}
