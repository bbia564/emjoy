import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_diary/pages/my_first/item.dart';
import 'package:styled_widget/styled_widget.dart';

import 'my_first_logic.dart';

class MyFirstPage extends StatelessWidget {
  final controller = Get.find<MyFirstLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My diary')),
      body: Obx(() {
        return controller.list.value.isEmpty
            ? Center(
                child: <Widget>[
                  Image.asset(
                    'assets/noData.webp',
                    width: 83,
                    height: 78,
                    fit: BoxFit.cover,
                  ).marginOnly(bottom: 10),
                  const Text(
                    'No data',
                    style: TextStyle(color: Color(0xff7c7c7c)),
                  )
                ].toColumn(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  var entity = controller.list.value[index];
                  return Item(
                    entity,
                    onTap: (v) async {
                      if (v == 0) {
                        entity.pinned = 1;
                        entity.pinnedTime = DateTime.now();
                        await controller.dbMy.updateMy(entity);
                        controller.getData();
                      } else {
                        await controller.dbMy.deleteMy(entity);
                        controller.getData();
                      }
                    },
                  );
                });
      }),
    );
  }
}
