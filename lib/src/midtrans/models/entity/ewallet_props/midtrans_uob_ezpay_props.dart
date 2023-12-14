class MidtransUobEzpayProps {
  /// The URL to redirect the customer back from the ShopeePay app. Default value is the finish URL, configured on your MAP account.
  final String? callbackUrl;

  MidtransUobEzpayProps({
    this.callbackUrl,
  });

  factory MidtransUobEzpayProps.fromJson(Map<String, dynamic> json) =>
      MidtransUobEzpayProps(
        callbackUrl: json["callback_url"],
      );

  Map<String, dynamic> toJson() => {
        "callback_url": callbackUrl,
      };
}
