class XenditFixedOtcResponse {
  final bool? isSingleUse;
  final String? status;
  final String? ownerId;
  final String? externalId;
  final String? retailOutletName;
  final String? prefix;
  final String? name;
  final String? paymentCode;
  final String? type;
  final int? expectedAmount;
  final DateTime? expirationDate;
  final String? id;

  XenditFixedOtcResponse({
    this.isSingleUse,
    this.status,
    this.ownerId,
    this.externalId,
    this.retailOutletName,
    this.prefix,
    this.name,
    this.paymentCode,
    this.type,
    this.expectedAmount,
    this.expirationDate,
    this.id,
  });

  factory XenditFixedOtcResponse.fromJson(Map<String, dynamic> json) =>
      XenditFixedOtcResponse(
        isSingleUse: json["is_single_use"],
        status: json["status"],
        ownerId: json["owner_id"],
        externalId: json["external_id"],
        retailOutletName: json["retail_outlet_name"],
        prefix: json["prefix"],
        name: json["name"],
        paymentCode: json["payment_code"],
        type: json["type"],
        expectedAmount: json["expected_amount"],
        expirationDate: json["expiration_date"] == null
            ? null
            : DateTime.parse(json["expiration_date"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "is_single_use": isSingleUse,
        "status": status,
        "owner_id": ownerId,
        "external_id": externalId,
        "retail_outlet_name": retailOutletName,
        "prefix": prefix,
        "name": name,
        "payment_code": paymentCode,
        "type": type,
        "expected_amount": expectedAmount,
        "expiration_date": expirationDate?.toIso8601String(),
        "id": id,
      };
}
