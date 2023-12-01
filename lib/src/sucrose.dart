// Artic is Indonesian payment gateway bridge for Flutter

import 'package:sucrose/src/xendit/services/http/xendit_http_request.dart';

import 'dart:convert';

class Sucrose {
//   String xenditApiKey = "";
//   void setXenditApi(String apiKey) {
//     xenditApiKey = "Basic ${base64.encode(utf8.encode("$apiKey:"))}";
// //    xenditApiKey = apiKey;
//   }

  Sucrose.initXendit({required String xenditApiKey}) {
    xendit = XenditHttpRequest.init(
        "Basic ${base64.encode(utf8.encode("$xenditApiKey:"))}");
  }

  // xendit services
  late XenditHttpRequest xendit;
}
