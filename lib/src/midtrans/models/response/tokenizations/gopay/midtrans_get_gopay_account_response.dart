import 'package:sucrose/src/midtrans/models/entity/midtrans_get_gopay_account_metadata.dart';

class MidtransGetGoPayAccountResponse {
  final String? statusCode;
  final String? paymentType;
  final String? accountId;
  final String? accountStatus;
  final MidtransGetGoPayAccountMetadata? metadata;

  MidtransGetGoPayAccountResponse({
    this.statusCode,
    this.paymentType,
    this.accountId,
    this.accountStatus,
    this.metadata,
  });

  factory MidtransGetGoPayAccountResponse.fromJson(Map<String, dynamic> json) =>
      MidtransGetGoPayAccountResponse(
        statusCode: json["status_code"],
        paymentType: json["payment_type"],
        accountId: json["account_id"],
        accountStatus: json["account_status"],
        metadata: json["metadata"] == null
            ? null
            : MidtransGetGoPayAccountMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "payment_type": paymentType,
        "account_id": accountId,
        "account_status": accountStatus,
        "metadata": metadata?.toJson(),
      };
}

class PaymentOptionMetadata {
  PaymentOptionMetadata();

  factory PaymentOptionMetadata.fromJson(Map<String, dynamic> json) =>
      PaymentOptionMetadata();

  Map<String, dynamic> toJson() => {};
}
