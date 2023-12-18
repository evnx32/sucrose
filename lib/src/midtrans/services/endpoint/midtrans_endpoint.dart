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

  String registerCard(
    String clientKey,
    String cardNumber,
    String cardExpMonth,
    String cardExpYear,
    String cardCvv,
  ) =>
      "/v2/card/register?client_key=$clientKey&card_number=$cardNumber&card_exp_month=$cardExpMonth&card_exp_year=$cardExpYear&card_cvv=$cardCvv";

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

  // Pay Account
  String payAccount() => "/v2/pay/account";

  // Get Pay Account
  String getPayAccount(String id) => "/v2/pay/account/$id";

  // Unbind Pay Account
  String unbindPayAccount(String id) => "/v2/pay/account/$id/unbind";

  // Subscription
  String subscription() => "/v1/subscriptions";

  // Get Subscription
  String getSubscription(String id) => "/v1/subscriptions/$id";

  // Enable Subscription
  String enableSubscription(String id) => "/v1/subscriptions/$id/enable";

  // Disable Subscription
  String disableSubscription(String id) => "/v1/subscriptions/$id/disable";

  // Update Subscription
  String updateSubscription(String id) => "/v1/subscriptions/$id";
}
