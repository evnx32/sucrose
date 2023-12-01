class XenditEwalletChannelProperties {
  final String? failureReturnUrl;
  final String? successReturnUrl;

  /// MAYA (PAYMAYA) required fields
  final String? cancelReturnUrl;

  /// OVO Required this field
  final String? mobileNumber;

  /// JENIUSPAY required fields
  final String? cashtag;

  XenditEwalletChannelProperties({
    this.failureReturnUrl,
    this.successReturnUrl,
    this.cancelReturnUrl,
    this.mobileNumber,
    this.cashtag,
  });

  factory XenditEwalletChannelProperties.fromJson(Map<String, dynamic> json) =>
      XenditEwalletChannelProperties(
        failureReturnUrl: json["failure_return_url"],
        successReturnUrl: json["success_return_url"],
        cancelReturnUrl: json["cancel_return_url"],
        mobileNumber: json["mobile_number"],
        cashtag: json["cashtag"],
      );

  Map<String, dynamic> toJson() => {
        if (mobileNumber != null) "mobile_number": mobileNumber,
        if (failureReturnUrl != null) "failure_return_url": failureReturnUrl,
        if (successReturnUrl != null) "success_return_url": successReturnUrl,
        if (cancelReturnUrl != null) "cancel_return_url": cancelReturnUrl,
        if (cashtag != null) "cashtag": cashtag,
      };
}
