// Artic is Indonesian payment gateway bridge for Flutter

import 'package:sucrose/src/xendit/services/http/xendit_http_request.dart';

import 'dart:convert';

class Sucrose {
  // xendit services
  late XenditHttpRequest xendit;

  /// Initialize Xendit with Xendit API key
  Sucrose.initXendit({required String xenditApiKey}) {
    xendit = XenditHttpRequest.init(
        "Basic ${base64.encode(utf8.encode("$xenditApiKey:"))}");
  }
}
