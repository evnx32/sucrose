class MidtransCardTokenResponse {
  /// Status code of transaction charge result.
  ///
  /// "200" for success, "400" when validation error.
  final String? statusCode;

  /// Status message describing the result of the API request.
  ///
  /// "OK, success request new token".
  final String? statusMessage;

  ///	The token id of the card.
  ///
  /// "48111111-1114-d3d690db-3e18-4edd-9fee-4d061e4eb6f3"
  ///
  /// Note: `token_id` is required during Card Payment Charge Transaction.
  final String? tokenId;

  /// Produced from one-way hashing of the given card number. This value is irreversible and will always be consistent for each card number.
  ///
  /// "6d9df2ff-ae9c-3cee-a5ff-a063dc476077"
  final String? hash;

  MidtransCardTokenResponse({
    this.statusCode,
    this.statusMessage,
    this.tokenId,
    this.hash,
  });

  factory MidtransCardTokenResponse.fromJson(Map<String, dynamic> json) =>
      MidtransCardTokenResponse(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        tokenId: json["token_id"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status_message": statusMessage,
        "token_id": tokenId,
        "hash": hash,
      };
}
