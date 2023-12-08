import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditChannelProperties {
  /// Indicates whether or not to use the Payment Method's points_balance in the transaction.
  ///
  /// For multiple use OVO, and SHOPEEPAY (ID):
  final XenditReedemPoints? redeemPoints;

  /// URL where the end-customer is redirected if the authorization is successful.
  final String? successReturnUrl;

  /// URL where the end-customer is redirected if the authorization fails.
  final String? failureReturnUrl;

  /// URL where the end-customer is redirected if the authorization is canceled.
  final String? cancelReturnUrl;

  /// Toggle used to require end-customer to input undergo OTP validation before completing a payment.
  ///
  /// Default value is true.
  final String? requireAuth;

  /// To indicate whether to perform 3DS on the payment request
  ///
  /// Default value is false.
  final bool? skipThreeDSecure;

  /// Tag for the Merchant ID that you want to associate this payment with. This is for merchants using their own MIDs to specify which MID they want to use
  final String? merchantIdTag;

  /// Type of “credential-on-file” / “card-on-file” / COF payment for subsequent usage. Indicates future card-on-file usage.
  ///
  /// If you intend for a card to be used for future COF transactions, then this value must be included so that Xendit can inform the processors of this setup, and then after that on every transaction following the first transaction.
  ///
  /// Default value is CUSTOMER_UNSCHEDULED
  ///
  /// For more info, see https://developers.xendit.co/api-reference/payments-api/#payment-object

  final String? cardonfileType;

  /// Object that contains the required information to perform payments.
  XenditChannelProperties({
    this.redeemPoints,
    this.successReturnUrl,
    this.failureReturnUrl,
    this.cancelReturnUrl,
    this.requireAuth,
    this.skipThreeDSecure,
    this.merchantIdTag,
    this.cardonfileType,
  });

  factory XenditChannelProperties.fromJson(Map<String, dynamic> json) =>
      XenditChannelProperties(
        redeemPoints: json["redeem_points"] != null
            ? XenditReedemPoints.values
                .firstWhere((element) => element.name == json["redeem_points"])
            : null,
        successReturnUrl: json["success_return_url"],
        failureReturnUrl: json["failure_return_url"],
        cancelReturnUrl: json["cancel_return_url"],
        requireAuth: json["require_auth"],
        skipThreeDSecure: json["skip_three_d_secure"],
        merchantIdTag: json["merchant_id_tag"],
        cardonfileType: json["cardonfile_type"],
      );

  Map<String, dynamic> toJson() => {
        if (redeemPoints != null) "redeem_points": redeemPoints?.name,
        if (successReturnUrl != null) "success_return_url": successReturnUrl,
        if (failureReturnUrl != null) "failure_return_url": failureReturnUrl,
        if (cancelReturnUrl != null) "cancel_return_url": cancelReturnUrl,
        if (requireAuth != null) "require_auth": requireAuth,
        if (skipThreeDSecure != null) "skip_three_d_secure": skipThreeDSecure,
        if (merchantIdTag != null) "merchant_id_tag": merchantIdTag,
      };
}
