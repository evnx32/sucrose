class MidtransGopayProps {
  /// Required for GoPay deeplink/QRIS. To determine appending callback URL in the deeplink. Default value: `false`.
  final bool? enableCallback;

  /// The HTTP or Deeplink URL to which the customer is redirected from Gojek app after successful payment. Default value: `callback_url` in dashboard settings.
  ///
  /// For GoPay Tokenization, please make sure `callback_url` is the same URL submitted on onboarding process. If callback_url is not specified by merchant, we will use merchant's finish redirect URL that is set on Midtrans Administration Portal, please make sure these URLs are also submitted during onboarding process.
  final String? callbackUrl;

  /// *Required for GoPay Tokenization*. The customer account ID linked during [Create Pay Account API](https://docs.midtrans.com/reference/create-pay-account).
  final String? accountId;

  /// Required for GoPay Tokenization. Token to specify the payment option made by the customer from [Get Pay Account API](https://docs.midtrans.com/reference/get-pay-account) metadata.
  final String? paymentOptionToken;

  /// Set the value to `true` to mark as a recurring transaction (no PIN challenge will be triggered to the user), only allowed for authorized merchants. Default value: `false`
  final bool? recurring;

  /// *Only applicable for GoPay Tokenization*. GoPay promotion ID to be used for payment. Acquired from Fetch Promotion API.
  ///
  /// Currently only support single promotion per transaction, the first promotion id on the list will be applied.
  final List<String>? promotionIds;

  /// Charge details using GoPay.
  MidtransGopayProps({
    this.enableCallback,
    this.callbackUrl,
    this.accountId,
    this.paymentOptionToken,
    this.recurring,
    this.promotionIds,
  });

  factory MidtransGopayProps.fromJson(Map<String, dynamic> json) =>
      MidtransGopayProps(
        enableCallback: json["enable_callback"],
        callbackUrl: json["callback_url"],
        accountId: json["account_id"],
        paymentOptionToken: json["payment_option_token"],
        recurring: json["recurring"],
        promotionIds: json["promotion_ids"] == null
            ? []
            : List<String>.from(json["promotion_ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "enable_callback": enableCallback,
        "callback_url": callbackUrl,
        "account_id": accountId,
        "payment_option_token": paymentOptionToken,
        "recurring": recurring,
        "promotion_ids": promotionIds == null
            ? []
            : List<dynamic>.from(promotionIds!.map((x) => x)),
      };
}
