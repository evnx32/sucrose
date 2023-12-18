class MidtransRegisterCardResponse {
  final String? statusCode;
  final String? savedTokenId;
  final String? transactionId;
  final String? maskedCard;

  MidtransRegisterCardResponse({
    this.statusCode,
    this.savedTokenId,
    this.transactionId,
    this.maskedCard,
  });

  factory MidtransRegisterCardResponse.fromJson(Map<String, dynamic> json) =>
      MidtransRegisterCardResponse(
        statusCode: json["status_code"],
        savedTokenId: json["saved_token_id"],
        transactionId: json["transaction_id"],
        maskedCard: json["masked_card"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "saved_token_id": savedTokenId,
        "transaction_id": transactionId,
        "masked_card": maskedCard,
      };
}
