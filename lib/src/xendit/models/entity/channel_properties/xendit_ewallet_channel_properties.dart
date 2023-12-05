class XenditEwalletChannelProperties {
  /// URL where the end-customer is redirected if the authorization failed
  final String? failureReturnUrl;

  /// URL where the end-customer is redirected if the authorization is successful
  final String? successReturnUrl;

  ///  URL where the end-customer is redirected if the authorization has been cancelled. End-customer can retry payment on the same link within 15 minutes.
  ///
  /// MAYA (PAYMAYA) required fields
  final String? cancelReturnUrl;

  /// Registered mobile number of the end-customer to the channel partner in E.164 Format.
  ///
  /// OVO Required this field
  final String? mobileNumber;

  ///Cashtag of the funding source
  ///
  /// JENIUSPAY required fields
  final String? cashtag;

  /// Object that contains the required information to perform payments with eWallet account
  ///
  /// This will be null if not applicable.
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
