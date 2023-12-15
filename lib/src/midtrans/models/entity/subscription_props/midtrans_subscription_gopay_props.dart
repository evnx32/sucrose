class MidtransSubscriptionGopayProps {
  ///	GoPay Account ID from Core API.
  ///
  /// You can check the account ID from the response of the Create GoPay Account API, [Click here for more information](https://docs.midtrans.com/reference/create-pay-account).
  final String accountId;

  /// GoPay subscription information, required if payment type is `gopay`
  MidtransSubscriptionGopayProps({
    required this.accountId,
  });

  factory MidtransSubscriptionGopayProps.fromJson(Map<String, dynamic> json) =>
      MidtransSubscriptionGopayProps(
        accountId: json["account_id"],
      );

  Map<String, dynamic> toJson() => {
        "account_id": accountId,
      };
}
