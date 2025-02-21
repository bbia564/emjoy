import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_diary/db_my/db_my.dart';
import 'package:my_diary/pages/my_add/my_add_binding.dart';
import 'package:my_diary/pages/my_add/my_add_view.dart';
import 'package:my_diary/pages/my_first/my_first_binding.dart';
import 'package:my_diary/pages/my_first/my_first_view.dart';
import 'package:my_diary/pages/my_second/my_second_binding.dart';
import 'package:my_diary/pages/my_second/my_second_view.dart';
import 'package:my_diary/pages/my_tab/my_tab_binding.dart';
import 'package:my_diary/pages/my_tab/my_tab_view.dart';
import 'package:my_diary/pages/no_network/no_network_binding.dart';
import 'package:my_diary/pages/no_network/no_network_view.dart';
import 'package:my_diary/router/my_names.dart';
import 'package:my_diary/router/my_pages.dart';

Color primaryColor = const Color(0xff2dcc71);
Color bgColor = const Color(0xfff2f1f6);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBMy().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Emjoy,
      initialRoute: '/my_tab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Emjoy = [
  GetPage(name: '/my_tab', page: () => MyTabPage(), binding: MyTabBinding()),
  GetPage(name: '/my_first', page: () => MyFirstPage(), binding: MyFirstBinding()),
  GetPage(name: '/my_second', page: () => const MySecondPage(), binding: MySecondBinding()),
  GetPage(name: '/my_add', page: () => MyAddPage(), binding: MyAddBinding()),
  GetPage(name: '/no_network', page: () => NoNetworkPage(), binding: NoNetworkBinding())
];
