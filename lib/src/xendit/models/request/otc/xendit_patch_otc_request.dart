class XenditPatchOtcRequest {
  /// Name of user - this might be used by the Retail Outlets cashier to validate the end user
  ///
  /// `Characters` alphanumeric
  ///
  /// `Special Characters: # / . " - , ' _ @ ( ) & ] [ :`
  ///
  /// `Minimum length` 1 character
  ///
  /// `Maximum length` 250 characters
  final String? customerName;

  /// The amount that is expected to be paid by end customer
  ///
  /// the minimum is PHP 50 and the maximum is PHP 10,000 for `7ELEVEN`
  ///
  /// the minimum is PHP 100 and the maximum is PHP 50,000 for `7ELEVEN_CLIQQ`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 30,000 for `CEBUANA`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 50,000 for `ECPAY`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 200,000 for `LBC`
  ///
  /// Integration via DragonPay
  ///
  /// the minimum is PHP 1 and the maximum is PHP 20,000 for `DP_PALAWAN`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 200,000 for `DP_MLHUILLIER`
  ///
  /// the minimum is PHP 15 and the maximum is PHP 50,000 for `DP_ECPAY_LOAN`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 20,000 for `DP_RD_PAWNSHOP`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 30,000 for `DP_CVM`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 50,000 for `DP_ECPAY_SCHOOL`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 20,000 for `DP_USSC`

  /// Note:
  ///
  /// amount is required if you want to create closed type payment code
  ///
  /// For open type payment code, `amount` field can be `empty` or `null`
  final double? amount;

  /// ISO 4217 Currency code
  ///
  /// Supported currency code: `PHP`
  final String? currency;

  /// The time when the payment code will be expired.
  ///
  /// the minimum is 2 hours and the maximum is 9 days for `7ELEVEN`
  ///
  /// timezone: `UTC+0`
  ///
  /// default: `The expired date will be 2 days from payment code generated`
  final DateTime? expiresAt;

  /// Description of the payment code.
  ///
  /// `Minimum length` 1 character
  ///
  /// `Maximum length` 250 characters
  final String? description;

  XenditPatchOtcRequest({
    this.customerName,
    this.amount,
    this.currency,
    this.expiresAt,
    this.description,
  });

  factory XenditPatchOtcRequest.fromJson(Map<String, dynamic> json) =>
      XenditPatchOtcRequest(
        customerName: json["customer_name"],
        amount: json["amount"],
        currency: json["currency"],
        expiresAt: json["expires_at"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        if (customerName != null) "customer_name": customerName,
        if (amount != null) "amount": amount,
        if (currency != null) "currency": currency,
        if (expiresAt != null) "expires_at": expiresAt,
        if (description != null) "description": description,
      };
}
