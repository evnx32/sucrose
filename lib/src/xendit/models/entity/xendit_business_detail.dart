import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditBusinessDetail {
  final String? businessName;
  final String? tradingName;
  final XenditBusinessType? businessType;
  final String? natureOfBusiness;
  final String? businessDomicile;
  final String? dateOfRegistration;

  XenditBusinessDetail({
    this.businessName,
    this.tradingName,
    this.businessType,
    this.natureOfBusiness,
    this.businessDomicile,
    this.dateOfRegistration,
  });

  factory XenditBusinessDetail.fromJson(Map<String, dynamic> json) =>
      XenditBusinessDetail(
        businessName: json["business_name"],
        tradingName: json["trading_name"],
        businessType: json["business_type"] == null
            ? null
            : XenditBusinessType.values.firstWhere(
                (element) => element.name == json["business_type"],
              ),
        natureOfBusiness: json["nature_of_business"],
        businessDomicile: json["business_domicile"],
        dateOfRegistration: json["date_of_registration"],
      );

  Map<String, dynamic> toJson() => {
        if (businessName != null) "business_name": businessName,
        if (tradingName != null) "trading_name": tradingName,
        if (businessType != null) "business_type": businessType?.name,
        if (natureOfBusiness != null) "nature_of_business": natureOfBusiness,
        if (businessDomicile != null) "business_domicile": businessDomicile,
        if (dateOfRegistration != null)
          "date_of_registration": dateOfRegistration,
      };
}
