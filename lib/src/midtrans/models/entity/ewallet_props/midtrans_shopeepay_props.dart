class MidtransShopeePayProps {
  /// The URL to redirect the customer back from the ShopeePay app. Default value is the finish URL, configured on your MAP account.
  final String? callbackUrl;

  MidtransShopeePayProps({
    this.callbackUrl,
  });

  factory MidtransShopeePayProps.fromJson(Map<String, dynamic> json) =>
      MidtransShopeePayProps(
        callbackUrl: json["callback_url"],
      );

  Map<String, dynamic> toJson() => {
        "callback_url": callbackUrl,
      };
}
