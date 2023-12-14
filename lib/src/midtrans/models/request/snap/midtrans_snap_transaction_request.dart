import 'package:sucrose/src/midtrans/models/entity/ewallet_props/midtrans_gopay_props.dart';
import 'package:sucrose/src/midtrans/models/entity/ewallet_props/midtrans_shopeepay_props.dart';
import 'package:sucrose/src/midtrans/models/entity/ewallet_props/midtrans_uob_ezpay_props.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_customer_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_item_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_transaction_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/va_props/midtrans_bca_va_props.dart';
import 'package:sucrose/src/midtrans/models/entity/va_props/midtrans_bni_va_props.dart';
import 'package:sucrose/src/midtrans/models/entity/va_props/midtrans_bri_va_props.dart';
import 'package:sucrose/src/midtrans/models/entity/va_props/midtrans_cimb_va_props.dart';
import 'package:sucrose/src/midtrans/models/entity/va_props/midtrans_permata_va_props.dart';

class MidtransSnapTransactionRequest {
  final MidtransTransactionDetail transactionDetails;
  final List<MidtransItemDetail>? itemDetails;
  final MidtransCustomerDetails? customerDetails;
  final List<String>? enabledPayments;
  final CreditCard? creditCard;
  final MidtransBcaVaProps? bcaVa;
  final MidtransBniVaProps? bniVa;
  final MidtransBriVaProps? briVa;
  final MidtransCimbVaProps? cimbVa;
  final MidtransPermataVaProps? permataVa;
  final MidtransShopeePayProps? shopeepay;
  final MidtransGopayProps? gopay;
  final Callbacks? callbacks;
  final MidtransUobEzpayProps? uobEzpay;
  final Expiry? expiry;
  final PageExpiry? pageExpiry;
  final Recurring? recurring;
  final String? customField1;
  final String? customField2;
  final String? customField3;

  MidtransSnapTransactionRequest({
    required this.transactionDetails,
    this.itemDetails,
    this.customerDetails,
    this.enabledPayments,
    this.creditCard,
    this.bcaVa,
    this.bniVa,
    this.briVa,
    this.cimbVa,
    this.permataVa,
    this.shopeepay,
    this.gopay,
    this.callbacks,
    this.uobEzpay,
    this.expiry,
    this.pageExpiry,
    this.recurring,
    this.customField1,
    this.customField2,
    this.customField3,
  });

  factory MidtransSnapTransactionRequest.fromJson(Map<String, dynamic> json) =>
      MidtransSnapTransactionRequest(
        transactionDetails:
            MidtransTransactionDetail.fromJson(json["transaction_details"]),
        itemDetails: json["item_details"] == null
            ? []
            : List<MidtransItemDetail>.from(json["item_details"]!
                .map((x) => MidtransItemDetail.fromJson(x))),
        customerDetails: json["customer_details"] == null
            ? null
            : MidtransCustomerDetails.fromJson(json["customer_details"]),
        enabledPayments: json["enabled_payments"] == null
            ? []
            : List<String>.from(json["enabled_payments"]!.map((x) => x)),
        creditCard: json["credit_card"] == null
            ? null
            : CreditCard.fromJson(json["credit_card"]),
        bcaVa: json["bca_va"] == null
            ? null
            : MidtransBcaVaProps.fromJson(json["bca_va"]),
        bniVa: json["bni_va"] == null
            ? null
            : MidtransBniVaProps.fromJson(json["bni_va"]),
        briVa: json["bri_va"] == null
            ? null
            : MidtransBriVaProps.fromJson(json["bri_va"]),
        cimbVa: json["cimb_va"] == null
            ? null
            : MidtransCimbVaProps.fromJson(json["cimb_va"]),
        permataVa: json["permata_va"] == null
            ? null
            : MidtransPermataVaProps.fromJson(json["permata_va"]),
        shopeepay: json["shopeepay"] == null
            ? null
            : MidtransShopeePayProps.fromJson(json["shopeepay"]),
        gopay: json["gopay"] == null
            ? null
            : MidtransGopayProps.fromJson(json["gopay"]),
        callbacks: json["callbacks"] == null
            ? null
            : Callbacks.fromJson(json["callbacks"]),
        uobEzpay: json["uob_ezpay"] == null
            ? null
            : MidtransUobEzpayProps.fromJson(json["uob_ezpay"]),
        expiry: json["expiry"] == null ? null : Expiry.fromJson(json["expiry"]),
        pageExpiry: json["page_expiry"] == null
            ? null
            : PageExpiry.fromJson(json["page_expiry"]),
        recurring: json["recurring"] == null
            ? null
            : Recurring.fromJson(json["recurring"]),
        customField1: json["custom_field1"],
        customField2: json["custom_field2"],
        customField3: json["custom_field3"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_details": transactionDetails.toJson(),
        if (itemDetails != null)
          "item_details":
              List<dynamic>.from(itemDetails!.map((x) => x.toJson())),
        if (customerDetails != null)
          "customer_details": customerDetails!.toJson(),
        if (enabledPayments != null) "enabled_payments": enabledPayments,
        if (creditCard != null) "credit_card": creditCard!.toJson(),
        if (bcaVa != null) "bca_va": bcaVa!.toJson(),
        if (bniVa != null) "bni_va": bniVa!.toJson(),
        if (briVa != null) "bri_va": briVa!.toJson(),
        if (cimbVa != null) "cimb_va": cimbVa!.toJson(),
        if (permataVa != null) "permata_va": permataVa!.toJson(),
        if (shopeepay != null) "shopeepay": shopeepay!.toJson(),
        if (gopay != null) "gopay": gopay!.toJson(),
        if (callbacks != null) "callbacks": callbacks!.toJson(),
        if (uobEzpay != null) "uob_ezpay": uobEzpay!.toJson(),
        if (expiry != null) "expiry": expiry!.toJson(),
        if (pageExpiry != null) "page_expiry": pageExpiry!.toJson(),
        if (recurring != null) "recurring": recurring!.toJson(),
        if (customField1 != null) "custom_field1": customField1,
        if (customField2 != null) "custom_field2": customField2,
        if (customField3 != null) "custom_field3": customField3,
      };
}

class Callbacks {
  final String? finish;

  Callbacks({
    this.finish,
  });

  factory Callbacks.fromJson(Map<String, dynamic> json) => Callbacks(
        finish: json["finish"],
      );

  Map<String, dynamic> toJson() => {
        "finish": finish,
      };
}

class CreditCard {
  final bool? secure;
  final String? channel;
  final String? bank;
  final Installment? installment;
  final List<String>? whitelistBins;
  final DynamicDescriptor? dynamicDescriptor;

  CreditCard({
    this.secure,
    this.channel,
    this.bank,
    this.installment,
    this.whitelistBins,
    this.dynamicDescriptor,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        secure: json["secure"],
        channel: json["channel"],
        bank: json["bank"],
        installment: json["installment"] == null
            ? null
            : Installment.fromJson(json["installment"]),
        whitelistBins: json["whitelist_bins"] == null
            ? []
            : List<String>.from(json["whitelist_bins"]!.map((x) => x)),
        dynamicDescriptor: json["dynamic_descriptor"] == null
            ? null
            : DynamicDescriptor.fromJson(json["dynamic_descriptor"]),
      );

  Map<String, dynamic> toJson() => {
        "secure": secure,
        "channel": channel,
        "bank": bank,
        "installment": installment?.toJson(),
        "whitelist_bins": whitelistBins == null
            ? []
            : List<dynamic>.from(whitelistBins!.map((x) => x)),
        "dynamic_descriptor": dynamicDescriptor?.toJson(),
      };
}

class DynamicDescriptor {
  final String? merchantName;
  final String? cityName;
  final String? countryCode;

  DynamicDescriptor({
    this.merchantName,
    this.cityName,
    this.countryCode,
  });

  factory DynamicDescriptor.fromJson(Map<String, dynamic> json) =>
      DynamicDescriptor(
        merchantName: json["merchant_name"],
        cityName: json["city_name"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "merchant_name": merchantName,
        "city_name": cityName,
        "country_code": countryCode,
      };
}

class Installment {
  final bool? required;
  final Terms? terms;

  Installment({
    this.required,
    this.terms,
  });

  factory Installment.fromJson(Map<String, dynamic> json) => Installment(
        required: json["required"],
        terms: json["terms"] == null ? null : Terms.fromJson(json["terms"]),
      );

  Map<String, dynamic> toJson() => {
        "required": required,
        "terms": terms?.toJson(),
      };
}

class Terms {
  final List<int>? bni;
  final List<int>? mandiri;
  final List<int>? cimb;
  final List<int>? bca;
  final List<int>? offline;

  Terms({
    this.bni,
    this.mandiri,
    this.cimb,
    this.bca,
    this.offline,
  });

  factory Terms.fromJson(Map<String, dynamic> json) => Terms(
        bni: json["bni"] == null
            ? []
            : List<int>.from(json["bni"]!.map((x) => x)),
        mandiri: json["mandiri"] == null
            ? []
            : List<int>.from(json["mandiri"]!.map((x) => x)),
        cimb: json["cimb"] == null
            ? []
            : List<int>.from(json["cimb"]!.map((x) => x)),
        bca: json["bca"] == null
            ? []
            : List<int>.from(json["bca"]!.map((x) => x)),
        offline: json["offline"] == null
            ? []
            : List<int>.from(json["offline"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "bni": bni == null ? [] : List<dynamic>.from(bni!.map((x) => x)),
        "mandiri":
            mandiri == null ? [] : List<dynamic>.from(mandiri!.map((x) => x)),
        "cimb": cimb == null ? [] : List<dynamic>.from(cimb!.map((x) => x)),
        "bca": bca == null ? [] : List<dynamic>.from(bca!.map((x) => x)),
        "offline":
            offline == null ? [] : List<dynamic>.from(offline!.map((x) => x)),
      };
}

class Expiry {
  final String? startTime;
  final String? unit;
  final int? duration;

  Expiry({
    this.startTime,
    this.unit,
    this.duration,
  });

  factory Expiry.fromJson(Map<String, dynamic> json) => Expiry(
        startTime: json["start_time"],
        unit: json["unit"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "start_time": startTime,
        "unit": unit,
        "duration": duration,
      };
}

class PageExpiry {
  final int? duration;
  final String? unit;

  PageExpiry({
    this.duration,
    this.unit,
  });

  factory PageExpiry.fromJson(Map<String, dynamic> json) => PageExpiry(
        duration: json["duration"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "unit": unit,
      };
}

class Recurring {
  final bool? required;
  final String? startTime;
  final String? intervalUnit;

  Recurring({
    this.required,
    this.startTime,
    this.intervalUnit,
  });

  factory Recurring.fromJson(Map<String, dynamic> json) => Recurring(
        required: json["required"],
        startTime: json["start_time"],
        intervalUnit: json["interval_unit"],
      );

  Map<String, dynamic> toJson() => {
        "required": required,
        "start_time": startTime,
        "interval_unit": intervalUnit,
      };
}
