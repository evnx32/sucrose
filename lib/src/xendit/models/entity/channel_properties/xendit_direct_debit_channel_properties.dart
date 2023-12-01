class XenditDirectDebitChannelProperties {
  final String? failureReturnUrl;
  final String? successReturnUrl;

  XenditDirectDebitChannelProperties({
    this.failureReturnUrl,
    this.successReturnUrl,
  });

  factory XenditDirectDebitChannelProperties.fromJson(
          Map<String, dynamic> json) =>
      XenditDirectDebitChannelProperties(
        failureReturnUrl: json["failure_return_url"],
        successReturnUrl: json["success_return_url"],
      );

  Map<String, dynamic> toJson() => {
        "failure_return_url": failureReturnUrl,
        "success_return_url": successReturnUrl,
      };
}
