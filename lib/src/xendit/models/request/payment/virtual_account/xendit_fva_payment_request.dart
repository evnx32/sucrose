class XenditFvaPaymentRequest {
  /// An ID of your choice. Often it is unique identifier like a phone number, email or transaction ID.
  ///
  /// Characters: Special and alphanumeric
  ///
  /// Minimum character: 1 character
  ///
  /// Maximum characters: 950 characters
  final String externalId;

  /// Bank code of the virtual account you want to create.
  ///
  /// Available bank codes for Indonesia: `BCA`, `BNI`, `BRI`, `BJB`, `BSI`, `BNC`, `CIMB`, `DBS`, `MANDIRI`, `PERMATA`, `SAHABAT_SAMPOERNA`
  ///
  /// Available bank codes for Vietnam: `PV`, `VIETCAPITAL`, `WOORI`
  ///
  /// Note: We recommend you to create `BNI` Virtual Account for interbank transfers for higher success rate.
  final String bankCode;

  /// Name of user/virtual account, - this will be displayed in the bank's user interface, e.g. ATM confirmation screens.
  ///
  /// `Characters` Only alphabet. For `BCA` Aggregator, alphabet and number are allowed.
  ///
  /// `Minimum length` 1 character, except `BCA` the minimum length is 3 characters
  ///
  /// Note:
  ///
  /// Name can only contain letters and spaces and has length restriction depending on the banks. And also cannot contains name from bank/institution/government.
  ///
  /// For Individual account type, VA name is not customizable and will always follow your business name.
  ///
  /// A prefix will be included in the response for BNI VA `XDT-` and CIMB VA `Xendit`. The prefix is mandatory from the bank.
  final String name;

  /// There are 2 types of Virtual Account amount: open or closed amount
  ///
  /// Open amount means your customer can pay any amount to the Virtual Account
  ///
  /// Closed amount means your customer can only pay amount specified by you. Payment will be rejected if attempted payment amount deviates from the amount you specified. Specify the amount using `expected_amount` parameter below
  final bool? isClosed;

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

  /// You can assign specific Virtual Account number using this parameter. If you do not send one, one will be picked at random.
  ///
  /// Make sure the number you specify is within your Virtual Account range. Check your Virtual Account [range in Virtual Account](https://dashboard.xendit.co/settings/payment-methods#virtual-accounts) Settings. API will throw error if you include merchant code (first 4 or 5 digits of your VA range, ie `26215` for BRI).
  ///
  /// Example: If your BRI Virtual Account range: `26215 9999000001` - `26215 9999999999`, request `virtual_account_number`: `9999100101` will be accepted as the value is within VA range, while `virtual_account_number`: `262159999100101` will throw `VIRTUAL_ACCOUNT_NUMBER_OUTSIDE_RANGE`
  ///
  /// Note: Your VA range in `TEST` and `LIVE` mode might be different. When going live, double check and adjust your request to follow the respective VA range
  final String? virtualAccountNumber;

  /// The country in which the virtual account operates.
  ///
  /// Available countries: `ID` and `VN`
  final String country;

  /// The currency of payment in which the virtual account can accept.
  ///
  /// Available currencies for Indonesia: `IDR` and `USD`
  ///
  /// Available currencies for Vietnam: `VND`
  final String currency;

  /// There are 2 types of Virtual Account:
  ///
  /// Single-use Virtual Account (`is_single_use`: `true`) can only be paid once. Used VA number can be recreated for other customer/invoice/transaction
  ///
  /// Multiple-use Virtual Account (`is_single_use`: `false`) allows your customer to pay to the same Virtual Account continuously
  final String? isSingleUse;

  /// Minimum amount to be paid by your customer for open Virtual Account, it should use an amount above the minimum amount from the bank.
  ///
  /// Available banks: `BCA`, `BNC`, and `CIMB`
  final double? minAmount;

  /// Maximum amount to be paid by your customer for open Virtual Account, it should use an amount below the maximum amount from the bank.
  ///
  /// Available banks: `BCA`, `BNC`, and `CIMB`
  final double? maxAmount;

  /// The suggested amount you want to assign.
  ///
  /// Available banks: `BRI` and `MANDIRI`
  final double? suggestedAmount;

  /// Description for the Virtual Account. Available for `BRI` and `BSI`.
  ///
  /// Characters Special and alphanumeric
  ///
  /// Minimum length 1 character
  final String? description;

  /// ISO8601 timestamp of Virtual Account expiration time
  ///
  /// Timezone: UTC+0
  final DateTime? expirationDate;

  /// Virtual Accounts are virtual bank accounts that can be created and assigned to your customers and act as medium to receive payments where your customers will pay via Bank Transfer.
  XenditFvaPaymentRequest({
    required this.externalId,
    required this.bankCode,
    required this.name,
    this.isClosed,
    this.expectedAmount,
    this.virtualAccountNumber,
    required this.country,
    required this.currency,
    this.isSingleUse,
    this.minAmount,
    this.maxAmount,
    this.suggestedAmount,
    this.description,
    this.expirationDate,
  });

  factory XenditFvaPaymentRequest.fromJson(Map<String, dynamic> json) =>
      XenditFvaPaymentRequest(
        externalId: json["external_id"],
        bankCode: json["bank_code"],
        name: json["name"],
        isClosed: json["is_closed"],
        expectedAmount: json["expected_amount"],
        virtualAccountNumber: json["virtual_account_number"],
        country: json["country"],
        currency: json["currency"],
        isSingleUse: json["is_single_use"],
        minAmount: json["min_amount"],
        maxAmount: json["max_amount"],
        suggestedAmount: json["suggested_amount"],
        description: json["description"],
        expirationDate: json["expiration_date"] == null
            ? null
            : DateTime.parse(json["expiration_date"]),
      );

  Map<String, dynamic> toJson() => {
        "external_id": externalId,
        "bank_code": bankCode,
        "name": name,
        if (isClosed != null) "is_closed": isClosed,
        if (expectedAmount != null) "expected_amount": expectedAmount,
        if (virtualAccountNumber != null)
          "virtual_account_number": virtualAccountNumber,
        "country": country,
        "currency": currency,
        if (isSingleUse != null) "is_single_use": isSingleUse,
        if (minAmount != null) "min_amount": minAmount,
        if (maxAmount != null) "max_amount": maxAmount,
        if (suggestedAmount != null) "suggested_amount": suggestedAmount,
        if (description != null) "description": description,
        if (expirationDate != null)
          "expiration_date":
              '${expirationDate!.toIso8601String().substring(0, 19)}Z',
      };
}
