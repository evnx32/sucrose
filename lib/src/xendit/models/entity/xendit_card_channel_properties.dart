class XenditCardChannelProperties {
  final dynamic skipThreeDSecure;
  final String? successReturnUrl;
  final String? failureReturnUrl;
  final dynamic cardonfileType;

  XenditCardChannelProperties({
    this.skipThreeDSecure,
    this.successReturnUrl,
    this.failureReturnUrl,
    this.cardonfileType,
  });

  factory XenditCardChannelProperties.fromJson(Map<String, dynamic> json) =>
      XenditCardChannelProperties(
        skipThreeDSecure: json["skip_three_d_secure"],
        successReturnUrl: json["success_return_url"],
        failureReturnUrl: json["failure_return_url"],
        cardonfileType: json["cardonfile_type"],
      );

  Map<String, dynamic> toJson() => {
        "skip_three_d_secure": skipThreeDSecure,
        "success_return_url": successReturnUrl,
        "failure_return_url": failureReturnUrl,
        "cardonfile_type": cardonfileType,
      };
}
