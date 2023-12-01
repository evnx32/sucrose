class XenditChannelProperties {
  final String? redeemPoints;
  final String? successReturnUrl;
  final String? failureReturnUrl;
  final String? cancelReturnUrl;
  final String? requireAuth;
  final bool? skipThreeDSecure;
  final String? merchantIdTag;
  final String? cardonfileType;

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
        redeemPoints: json["redeem_points"],
        successReturnUrl: json["success_return_url"],
        failureReturnUrl: json["failure_return_url"],
        cancelReturnUrl: json["cancel_return_url"],
        requireAuth: json["require_auth"],
        skipThreeDSecure: json["skip_three_d_secure"],
        merchantIdTag: json["merchant_id_tag"],
        cardonfileType: json["cardonfile_type"],
      );

  Map<String, dynamic> toJson() => {
        "redeem_points": redeemPoints,
        "success_return_url": successReturnUrl,
        "failure_return_url": failureReturnUrl,
        "cancel_return_url": cancelReturnUrl,
        "require_auth": requireAuth,
        "skip_three_d_secure": skipThreeDSecure,
        "merchant_id_tag": merchantIdTag,
        "cardonfile_type": cardonfileType,
      };
}
