class MidtransSnapTransactionResponse {
  final String? token;
  final String? redirectUrl;

  MidtransSnapTransactionResponse({
    this.token,
    this.redirectUrl,
  });

  factory MidtransSnapTransactionResponse.fromJson(Map<String, dynamic> json) =>
      MidtransSnapTransactionResponse(
        token: json["token"],
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "redirect_url": redirectUrl,
      };
}
