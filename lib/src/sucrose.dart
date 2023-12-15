import 'package:sucrose/src/midtrans/enums/enums.dart';
import 'package:sucrose/src/midtrans/services/http/midtrans_http_request.dart';
import 'package:sucrose/src/xendit/services/http/xendit_http_request.dart';

import 'dart:convert';

class Sucrose {
  // xendit services
  late XenditHttpRequest xendit;
  late MidtransHttpRequest midtrans;

  /// Initialize Xendit with Xendit API key
  Sucrose.initXendit({required String xenditApiKey, bool debug = false}) {
    xendit = XenditHttpRequest.init(
      "Basic ${base64.encode(utf8.encode("$xenditApiKey:"))}",
      debug: debug,
    );
  }

  /// Initialize Midtrans with Midtrans API key
  Sucrose.initMidtrans({
    required String midtransApiKey,
    required MidtransEnvironment environment,
    bool debug = false,
  }) {
    midtrans = MidtransHttpRequest.init(
      apiKey: "Basic ${base64.encode(utf8.encode("$midtransApiKey:"))}",
      environment: environment,
      debug: debug,
    );
  }
}
