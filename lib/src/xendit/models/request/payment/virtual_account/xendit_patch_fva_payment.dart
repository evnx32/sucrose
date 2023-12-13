class XenditPatchFvaPayment {
  /// There are 2 types of Virtual Account:
  ///
  /// Single-use Virtual Account (`is_single_use`: `true`) can only be paid once. Used VA number can be recreated for other customer/invoice/transaction
  ///
  /// Multiple-use Virtual Account (`is_single_use`: `false`) allows your customer to pay to the same Virtual Account continuously
  final bool? isSingleUse;

  /// Required amount to be paid by your customer for closed Virtual Account.
  ///
  /// For `BNI`,`BJB`,`BRI`,`BSI`, `BNC`, `MANDIRI`, and `SAHABAT_SAMPOERNA`:
  ///
  /// Minimum amount: IDR 1
  ///
  /// Maximum amount: IDR 50,000,000,000
  ///
  /// For `PERMATA`:
  ///
  /// Minimum amount: IDR 1
  ///
  /// Maximum amount: IDR 9,999,999,999
  ///
  /// For `BCA`:
  ///
  /// Minimum amount: IDR 10,000
  ///
  /// Maximum amount: IDR 999,999,999,999
  ///
  /// For `CIMB`:
  ///
  /// Minimum amount: IDR 1,000
  ///
  /// Maximum amount: IDR 50,000,000,000
  ///
  /// For `DBS`:
  ///
  /// Minimum amount: USD 1.00
  ///
  /// Maximum amount: USD 50,000,000,000.00
  ///
  /// For `PV`, `VIETCAPITAL`, and `WOORI`:
  ///
  /// Minimum amount: VND 10,000
  ///
  /// Maximum amount: VND 499,999,999
  final double? expectedAmount;

  /// Minimum amount to be paid by your customer for open Virtual Account, it should use an amount above the minimum amount from the bank.
  ///
  /// Available banks: `BCA`, `BNC`, and `CIMB`
  final String? minAmount;

  /// Maximum amount to be paid by your customer for open Virtual Account, it should use an amount below the maximum amount from the bank.
  ///
  /// Available banks: `BCA`, `BNC`, and `CIMB`
  final String? maxAmount;

  /// The suggested amount you want to assign.
  ///
  /// Available banks: `BRI` and `MANDIRI`
  final int? suggestedAmount;

  /// ISO8601 timestamp of Virtual Account expiration time
  ///
  /// Timezone: UTC+0
  final String? expirationDate;

  /// Description for the Virtual Account. Available for `BRI` and `BSI`.
  ///
  /// Characters Special and alphanumeric
  ///
  /// Minimum length 1 character
  final String? description;

  /// An ID of your choice. Often it is unique identifier like a phone number, email or transaction ID.
  ///
  /// Characters: Special and alphanumeric
  ///
  /// Minimum character: 1 character
  ///
  /// Maximum characters: 950 characters
  final String? externalId;

  /// Object of additional information the merchant may use. Merchant defines the JSON properties and values
  XenditPatchFvaPayment({
    this.isSingleUse,
    this.expectedAmount,
    this.minAmount,
    this.maxAmount,
    this.suggestedAmount,
    this.expirationDate,
    this.description,
    this.externalId,
  });

  factory XenditPatchFvaPayment.fromJson(Map<String, dynamic> json) =>
      XenditPatchFvaPayment(
        isSingleUse: json["is_single_use"],
        expectedAmount: json["expected_amount"],
        minAmount: json["min_amount"],
        maxAmount: json["max_amount"],
        suggestedAmount: json["suggested_amount"],
        expirationDate: json["expiration_date"],
        description: json["description"],
        externalId: json["external_id"],
      );

  Map<String, dynamic> toJson() => {
        if (isSingleUse != null) "is_single_use": isSingleUse,
        if (expectedAmount != null) "expected_amount": expectedAmount,
        if (minAmount != null) "min_amount": minAmount,
        if (maxAmount != null) "max_amount": maxAmount,
        if (suggestedAmount != null) "suggested_amount": suggestedAmount,
        if (expirationDate != null) "expiration_date": expirationDate,
        if (description != null) "description": description,
        if (externalId != null) "external_id": externalId,
      };
}
