class MidtransCreditCard {
  /// Token id represents customer credit card information.
  final String? tokenId;

  MidtransCreditCard({
    this.tokenId,
  });

  factory MidtransCreditCard.fromJson(Map<String, dynamic> json) =>
      MidtransCreditCard(
        tokenId: json["token_id"],
      );

  Map<String, dynamic> toJson() => {
        "token_id": tokenId,
      };
}
