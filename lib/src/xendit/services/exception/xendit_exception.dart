// To parse this JSON data, do
//
//     final xenditException = xenditExceptionFromJson(jsonString);

import 'dart:convert';

XenditException xenditExceptionFromJson(String str) =>
    XenditException.fromJson(json.decode(str));

String xenditExceptionToJson(XenditException data) =>
    json.encode(data.toJson());

class XenditException {
  final String? errorCode;
  final String? message;
  final List<Error>? errors;

  XenditException({
    this.errorCode,
    this.message,
    this.errors,
  });

  factory XenditException.fromJson(Map<String, dynamic> json) =>
      XenditException(
        errorCode: json["error_code"],
        message: json["message"],
        errors: json["errors"] == null
            ? []
            : List<Error>.from(json["errors"]!.map((x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "message": message,
        "errors": errors == null
            ? []
            : List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class Error {
  final String? path;
  final String? message;

  Error({
    this.path,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        path: json["path"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "message": message,
      };
}
