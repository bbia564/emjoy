import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_diary/main.dart';
import 'package:my_diary/pages/my_add/my_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'my_add_logic.dart';

class MyAddPage extends GetView<MyAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        backgroundColor: Colors.white,
        actions: [
          Text(
            'Commit',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.commit();
          })
        ],
      ),
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(12),
            child: GetBuilder<MyAddLogic>(builder: (_) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  const Text(
                    'Choose mood',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 51,
                    child: GridView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, mainAxisSpacing: 2),
                        itemCount: 6,
                        itemBuilder: (_, index) {
                          return Container(
                            padding: const EdgeInsets.all(7),
                            child: Image.asset(
                              'assets/icon$index.webp',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                              .decorated(
                              borderRadius: BorderRadius.circular(4),
                              border: controller.type == index
                                  ? Border.all(color: primaryColor)
                                  : null)
                              .gestures(onTap: () {
                            controller.type = index;
                            controller.update();
                          });
                        }),
                  ),
                  Divider(
                    height: 30,
                    color: Colors.grey[300],
                  ),
                  MyTextField(
                      hintText: 'Fill in the diary',
                      maxLength: 500,
                      maxLines: 10,
                      value: controller.content,
                      onChange: (v) {
                        controller.content = v;
                      })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              );
            }),
          )
              .decorated(
              color: Colors.white, borderRadius: BorderRadius.circular(20))
              .marginAll(15)),
    );
  }
}
