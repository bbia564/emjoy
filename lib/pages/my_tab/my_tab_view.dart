import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_diary/pages/my_add/my_add_view.dart';
import 'package:my_diary/pages/my_first/my_first_logic.dart';
import 'package:my_diary/pages/my_first/my_first_view.dart';
import 'package:my_diary/pages/my_second/my_second_view.dart';

import '../../main.dart';
import 'my_tab_logic.dart';

class MyTabPage extends GetView<MyTabLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [MyFirstPage(), MyAddPage(), MySecondPage()],
      ),
      bottomNavigationBar: Obx(() => _navMBars()),
    );
  }

  Widget _navMBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            color: primaryColor,
            size: 40,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/my_add')?.then((_) {
            MyFirstLogic firstLogic = Get.find();
            firstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
