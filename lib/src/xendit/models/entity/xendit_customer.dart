// To parse this JSON data, do
//
//     final xenditCustomer = xenditCustomerFromJson(jsonString);

import 'dart:convert';

import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_business_detail.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_individual_detail.dart';

XenditCustomer xenditCustomerFromJson(String str) =>
    XenditCustomer.fromJson(json.decode(str));

String xenditCustomerToJson(XenditCustomer data) => json.encode(data.toJson());

class XenditCustomer {
  final String referenceId;

  /// If you want to create a customer with individual detail, set this to `XenditCustomerType.individual`. If you want to create a customer with business detail, set this to `XenditCustomerType.business`.
  /// then you can set XenidtIndividualDetail or XenditBusinessDetail according to the type you set.
  ///
  /// if you set `XenditCustomerType.individual`, you must set `XenditIndividualDetail` and set `XenditBusinessDetail` to null or don't set it.
  final XenditCustomerType type;
  final XenditIndividualDetail? individualDetail;
  final XenditBusinessDetail? businessDetail;
  final String email;
  final String mobileNumber;

  XenditCustomer({
    required this.referenceId,
    required this.type,
    this.individualDetail,
    this.businessDetail,
    required this.email,
    required this.mobileNumber,
  });

  factory XenditCustomer.fromJson(Map<String, dynamic> json) => XenditCustomer(
        referenceId: json["reference_id"],
        type: json["type"],
        individualDetail:
            XenditIndividualDetail.fromJson(json["individual_detail"]),
        businessDetail: json["business_detail"] == null
            ? null
            : XenditBusinessDetail.fromJson(json["business_detail"]),
        email: json["email"],
        mobileNumber: json["mobile_number"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "type": type.name,
        if (individualDetail != null)
          "individual_detail": individualDetail!.toJson(),
        if (businessDetail != null) "business_detail": businessDetail!.toJson(),
        "email": email,
        "mobile_number": mobileNumber,
      };
}
