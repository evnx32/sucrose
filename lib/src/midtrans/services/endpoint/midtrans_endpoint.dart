class MidtransEndpoint {
  String charge() => "/v2/charge";

  String cardToken(
    String clientKey,
    String cardNumber,
    String cardExpMonth,
    String cardExpYear,
    String cardCvv,
  ) =>
      "/v2/token?client_key=$clientKey&card_number=$cardNumber&card_exp_month=$cardExpMonth&card_exp_year=$cardExpYear&card_cvv=$cardCvv";

  // Cancel Transaction
  String cancelTransaction(String id) => "/v2/$id/cancel";

  // Expire Transaction
  String expireTransaction(String id) => "/v2/$id/expire";

  // Refund Transaction
  String refundTransaction(String id) => "/v2/$id/refund";

  // Transaction Status
  String transactionStatus(String id) => "/v2/$id/status";

  // Snap Transaction
  String snapTransaction() => "/snap/v1/transactions";
}
