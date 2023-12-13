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
}
