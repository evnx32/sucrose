class XenditPatchFixedOtcRequest {
  /// Name of user - this might be used by the Retail Outlets cashier to validate the end user
  ///
  /// `Characters` alphanumeric
  ///
  /// `Special Characters: # / . " - , ' _ @ ( ) & ] [ :`
  ///
  /// `Minimum length` 1 character
  ///
  /// `Maximum length` For Alfamart 40 character, for Indomaret 45 character
  final String? name;

  /// The amount that is expected to be paid by end customer
  ///
  /// the minimum is Rp 10,000 and the maximum is Rp 2,500,000 for Alfamart
  ///
  /// the minimum is Rp 10,000 and the maximum is Rp 5,000,000 for Indomaret
  final double? expectedAmount;

  /// The time when the fixed payment code will be expired
  ///
  /// timezone: `UTC`
  ///
  /// default: `The expired date will be 31 years from payment code generated`
  final DateTime? expirationDate;

  XenditPatchFixedOtcRequest({
    this.name,
    this.expectedAmount,
    this.expirationDate,
  });

  factory XenditPatchFixedOtcRequest.fromJson(Map<String, dynamic> json) =>
      XenditPatchFixedOtcRequest(
        name: json["name"],
        expectedAmount: json["expected_amount"],
        expirationDate: json["expiration_date"] == null
            ? null
            : DateTime.parse(json["expiration_date"]),
      );

  Map<String, dynamic> toJson() => {
        if (name != null) "name": name,
        if (expectedAmount != null) "expected_amount": expectedAmount,
        if (expirationDate != null)
          "expiration_date":
              '${expirationDate!.toIso8601String().substring(0, 19)}Z',
      };
}
