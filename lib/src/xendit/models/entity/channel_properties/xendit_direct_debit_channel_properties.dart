class XenditDirectDebitChannelProperties {
  final String? failureReturnUrl;
  final String? successReturnUrl;
  final String? mobileNumber;
  final String? cardLastFour;
  final String? cardExpiry;
  final String? email;

  XenditDirectDebitChannelProperties({
    this.failureReturnUrl,
    this.successReturnUrl,
    this.mobileNumber,
    this.cardLastFour,
    this.cardExpiry,
    this.email,
  });

  factory XenditDirectDebitChannelProperties.fromJson(
          Map<String, dynamic> json) =>
      XenditDirectDebitChannelProperties(
        failureReturnUrl: json["failure_return_url"],
        successReturnUrl: json["success_return_url"],
        mobileNumber: json["mobile_number"],
        cardLastFour: json["card_last_four"],
        cardExpiry: json["card_expiry"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        if (mobileNumber != null) "mobile_number": mobileNumber,
        if (failureReturnUrl != null) "failure_return_url": failureReturnUrl,
        if (successReturnUrl != null) "success_return_url": successReturnUrl,
        if (cardLastFour != null) "card_last_four": cardLastFour,
        if (cardExpiry != null) "card_expiry": cardExpiry,
        if (email != null) "email": email,
      };
}
