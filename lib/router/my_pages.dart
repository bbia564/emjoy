
import 'package:get/get.dart';
import 'package:my_diary/pages/my_tab/my_tab_binding.dart';
import 'package:my_diary/pages/my_tab/my_tab_view.dart';
import 'package:my_diary/pages/no_network/no_network_view.dart';
import 'package:my_diary/router/my_names.dart';

import '../pages/my_add/my_add_binding.dart';
import '../pages/my_add/my_add_view.dart';
import '../pages/my_first/my_first_binding.dart';
import '../pages/my_first/my_first_view.dart';
import '../pages/my_second/my_second_binding.dart';
import '../pages/my_second/my_second_view.dart';
import '../pages/no_network/no_network_binding.dart';

class MyPages {

  static pageBuilder({
    required String name,
    required GetPageBuilder page,
    Bindings? binding,
  }) {
    return GetPage(
      name: name,
      page: page,
      binding: binding,
      preventDuplicates: true,
      transition: Transition.cupertino,
      popGesture: true,
    );
  }

  static List<GetPage> list = [
    pageBuilder(name: MyNames.myTab, page: () => MyTabPage(), binding: MyTabBinding()),
    pageBuilder(name: MyNames.myFirst, page: () => MyFirstPage(), binding: MyFirstBinding()),
    pageBuilder(name: MyNames.mySecond, page: () => MySecondPage(), binding: MySecondBinding()),
    pageBuilder(name: MyNames.myAdd, page: () => MyAddPage(), binding: MyAddBinding()),
    pageBuilder(name: MyNames.noNetwork, page: () => NoNetworkPage(), binding: NoNetworkBinding())
  ];
}