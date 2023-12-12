class XenditFixedOtcRequest {
  /// An ID of your choice. Often it is unique identifier like a phone number, email or transaction ID. Maximum length allowed is 1000 characters.
  ///
  /// `Characters` Special and alphanumeric
  ///
  /// `Minimum length` 1 character
  final String externalId;

  /// Name of the fixed payment code you want to create
  ///
  /// Available Retail Outlets: `ALFAMART` and `INDOMARET`
  final String retailOutletName;

  /// Name of user - this might be used by the Retail Outlets cashier to validate the end user
  ///
  /// `Characters` alphanumeric
  ///
  /// `Special Characters: # / . " - , ' _ @ ( ) & ] [ :`
  ///
  /// `Minimum length` 1 character
  ///
  /// `Maximum length` For Alfamart 40 character, for Indomaret 45 character
  final String name;

  /// The amount that is expected to be paid by end customer
  ///
  /// the minimum is Rp 10,000 and the maximum is Rp 2,500,000 for Alfamart
  ///
  /// the minimum is Rp 10,000 and the maximum is Rp 5,000,000 for Indomaret
  final double expectedAmount;

  /// You can assign specific fixed payment code using this parameter e.g `12345`. If you do not send one, one will be picked at random
  ///
  /// Make sure when you want to create payment code, you do not include the prefix on this field. For example: your prefix is `PSTEST` and you want to create payment code `PSTEST12345`, you can only fill `12345` on this field
  ///
  /// You can check your prefix information on [Retail Outlet details](https://dashboard.xendit.co/settings/payment-methods#retail-outlets)
  ///
  /// default: `random string`
  final String? paymentCode;

  /// The time when the fixed payment code will be expired
  ///
  /// timezone: `UTC`
  ///
  /// default: `The expired date will be 31 years from payment code generated`
  final DateTime? expirationDate;

  /// When set to `true`, the fixed payment code will be inactive after it is paid
  ///
  /// default: `false`
  final bool? isSingleUse;

  XenditFixedOtcRequest({
    required this.externalId,
    required this.retailOutletName,
    required this.name,
    required this.expectedAmount,
    this.paymentCode,
    this.expirationDate,
    this.isSingleUse,
  });

  factory XenditFixedOtcRequest.fromJson(Map<String, dynamic> json) =>
      XenditFixedOtcRequest(
        externalId: json["external_id"],
        retailOutletName: json["retail_outlet_name"],
        name: json["name"],
        expectedAmount: json["expected_amount"],
        paymentCode: json["payment_code"],
        expirationDate: json["expiration_date"],
        isSingleUse: json["is_single_use"],
      );

  Map<String, dynamic> toJson() => {
        "external_id": externalId,
        "retail_outlet_name": retailOutletName,
        "name": name,
        "expected_amount": expectedAmount,
        if (paymentCode != null) "payment_code": paymentCode,
        if (expirationDate != null) "expiration_date": expirationDate,
        if (isSingleUse != null) "is_single_use": isSingleUse,
      };
}
