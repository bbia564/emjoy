import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_diary/db_my/db_my.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../db_my/my_entity.dart';
import '../my_first/my_first_logic.dart';

class MySecondLogic extends GetxController {
  DBMy dbMy = Get.find();

  var list = <MyEntity>[].obs;

  List<int> typeList = [0,0,0,0,0,0];

  void getData() async {
    list.value = await dbMy.getMyAllData();
    final type0Num = list.where((element) => element.type == 0).length;
    final type1Num = list.where((element) => element.type == 1).length;
    final type2Num = list.where((element) => element.type == 2).length;
    final type3Num = list.where((element) => element.type == 3).length;
    final type4Num = list.where((element) => element.type == 4).length;
    final type5Num = list.where((element) => element.type == 5).length;
    typeList.clear();
    typeList
        .addAll([type0Num, type1Num, type2Num, type3Num, type4Num, type5Num]);
    update();
  }

  cleanMyData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbMy.cleanMyData();
            MyFirstLogic firstLogic = Get.find();
            firstLogic.getData();
            getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutMyUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 75,
        height: 75,
      ),
      children: [
        const Text(
            """We can record your diary and mood"""),
      ],
      context: context,
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
