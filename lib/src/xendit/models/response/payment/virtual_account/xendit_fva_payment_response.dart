class XenditFvaPaymentResponse {
  final String? id;
  final String? ownerId;
  final String? externalId;
  final String? accountNumber;
  final String? bankCode;
  final String? merchantCode;
  final String? name;
  final bool? isClosed;
  final int? expectedAmount;
  final DateTime? expirationDate;
  final bool? isSingleUse;
  final String? status;
  final String? currency;
  final String? country;

  XenditFvaPaymentResponse({
    this.id,
    this.ownerId,
    this.externalId,
    this.accountNumber,
    this.bankCode,
    this.merchantCode,
    this.name,
    this.isClosed,
    this.expectedAmount,
    this.expirationDate,
    this.isSingleUse,
    this.status,
    this.currency,
    this.country,
  });

  factory XenditFvaPaymentResponse.fromJson(Map<String, dynamic> json) =>
      XenditFvaPaymentResponse(
        id: json["id"],
        ownerId: json["owner_id"],
        externalId: json["external_id"],
        accountNumber: json["account_number"],
        bankCode: json["bank_code"],
        merchantCode: json["merchant_code"],
        name: json["name"],
        isClosed: json["is_closed"],
        expectedAmount: json["expected_amount"],
        expirationDate: json["expiration_date"] == null
            ? null
            : DateTime.parse(json["expiration_date"]),
        isSingleUse: json["is_single_use"],
        status: json["status"],
        currency: json["currency"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "owner_id": ownerId,
        "external_id": externalId,
        "account_number": accountNumber,
        "bank_code": bankCode,
        "merchant_code": merchantCode,
        "name": name,
        "is_closed": isClosed,
        "expected_amount": expectedAmount,
        "expiration_date": expirationDate?.toIso8601String(),
        "is_single_use": isSingleUse,
        "status": status,
        "currency": currency,
        "country": country,
      };
}
