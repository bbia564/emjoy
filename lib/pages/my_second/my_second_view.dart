import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_diary/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'my_second_logic.dart';

class MySecondPage extends GetView<MySecondLogic> {
  const MySecondPage({super.key});

  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all records', 'About us'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 0
            ? Text(
                'Totla ${controller.list.value.length}',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              )
            : const Text(
                '1.0.0',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanMyData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GetBuilder<MySecondLogic>(
            init: MySecondLogic(),
            builder: (_) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      const Text(
                        'Mood quantity',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        height: 10,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 150,
                        child: Align(
                          alignment: Alignment.center,
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 135 / 50),
                              itemCount: 6,
                              itemBuilder: (_, index) {
                                return <Widget>[
                                  Expanded(
                                      child: <Widget>[
                                    Container(
                                      width: 18,
                                    ).decorated(color: const Color(0xffededed)),
                                    Visibility(
                                      visible: controller.typeList[index] != 0,
                                      child: LayoutBuilder(builder: (_, max) {
                                        return SizedBox(
                                          width: 18,
                                          height: max.maxHeight *
                                              controller.typeList[index] /
                                              controller.list.value.length,
                                        ).decorated(color: primaryColor);
                                      }),
                                    )
                                  ].toStack(alignment: Alignment.bottomCenter)),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  <Widget>[
                                    const SizedBox(
                                      width: 50,
                                      height: 50,
                                    ),
                                    Image.asset(
                                      'assets/icon$index.webp',
                                      width: 38,
                                      height: 38,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      height: 14,
                                      child: Text(
                                        controller.typeList[index].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: primaryColor, fontSize: 10),
                                      ),
                                    ).decorated(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.white,
                                        border: Border.all(color: primaryColor))
                                  ].toStack(alignment: Alignment.topRight)
                                ].toColumn();
                              }),
                        ),
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child:
                        <Widget>[_item(0, context), _item(1, context)].toColumn(
                            separator: Divider(
                      height: 15,
                      color: Colors.grey[300],
                    )),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15))
                ].toColumn(),
              );
            }).marginAll(15),
      )),
    );
  }
}
