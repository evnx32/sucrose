class XenditCardChannelProperties {
  /// To indicate whether to perform 3DS on the payment request
  ///
  /// Defaults to false
  final bool skipThreeDSecure;

  /// URL where end-customer will be redirected to after successful payment
  final String? successReturnUrl;

  /// URL where end-customer will be redirected to after failed payment
  final String? failureReturnUrl;

  /// Tag for the Merchant ID that you want to associate this payment with. This is for merchants using their own MIDs to specify which MID they want to use.
  final String? merchantIdTag;

  /// Type of “credential-on-file” / “card-on-file” / COF payment for subsequent usage. Indicates future card-on-file usage.
  ///
  /// If you intend for a card to be used for future COF transactions, then this value must be included so that Xendit can inform the processors of this setup, and then after that on every transaction following the first transaction.
  ///
  /// Defaults to CUSTOMER_UNSCHEDULED
  final String? cardonfileType;

  XenditCardChannelProperties({
    required this.skipThreeDSecure,
    this.successReturnUrl,
    this.failureReturnUrl,
    this.merchantIdTag,
    this.cardonfileType,
  });

  factory XenditCardChannelProperties.fromJson(Map<String, dynamic> json) =>
      XenditCardChannelProperties(
        skipThreeDSecure: json["skip_three_d_secure"],
        successReturnUrl: json["success_return_url"],
        failureReturnUrl: json["failure_return_url"],
        merchantIdTag: json["merchant_id_tag"],
        cardonfileType: json["cardonfile_type"],
      );

  Map<String, dynamic> toJson() => {
        "skip_three_d_secure": skipThreeDSecure,
        if (successReturnUrl != null) "success_return_url": successReturnUrl,
        if (failureReturnUrl != null) "failure_return_url": failureReturnUrl,
        if (merchantIdTag != null) "merchant_id_tag": merchantIdTag,
        if (cardonfileType != null) "cardonfile_type": cardonfileType,
      };
}
