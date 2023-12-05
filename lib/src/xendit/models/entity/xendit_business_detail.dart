import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditBusinessDetail {
  /// Name of the business
  final String? businessName;

  /// Trading name of the business
  final String? tradingName;

  /// Legal entity type of the business
  final XenditBusinessType? businessType;

  /// Free text description of the type of business this entity pursues. Examples are: Ecommerce, Travel
  final String? natureOfBusiness;

  /// Registered country of the business

  /// `Format` ISO 3166-2 Country Code
  final String? businessDomicile;

  /// Business registration date

  /// `Format` YYYY-MM-DD string
  final String? dateOfRegistration;

  /// Object containing details of the business. Will be null if type is not BUSINESS
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
