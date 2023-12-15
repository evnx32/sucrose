import 'package:sucrose/src/midtrans/models/entity/midtrans_action.dart';

class MidtransGoPayAccountResponse {
  final String? statusCode;
  final String? paymentType;
  final String? accountId;
  final String? accountStatus;
  final List<MidtransAction>? actions;
  final MidtransGoPayAccountMetadata? metadata;

  MidtransGoPayAccountResponse({
    this.statusCode,
    this.paymentType,
    this.accountId,
    this.accountStatus,
    this.actions,
    this.metadata,
  });

  factory MidtransGoPayAccountResponse.fromJson(Map<String, dynamic> json) =>
      MidtransGoPayAccountResponse(
        statusCode: json["status_code"],
        paymentType: json["payment_type"],
        accountId: json["account_id"],
        accountStatus: json["account_status"],
        actions: json["actions"] == null
            ? []
            : List<MidtransAction>.from(
                json["actions"]!.map((x) => MidtransAction.fromJson(x))),
        metadata: json["metadata"] == null
            ? null
            : MidtransGoPayAccountMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "payment_type": paymentType,
        "account_id": accountId,
        "account_status": accountStatus,
        "actions": actions == null
            ? []
            : List<dynamic>.from(actions!.map((x) => x.toJson())),
        "metadata": metadata?.toJson(),
      };
}

class MidtransGoPayAccountMetadata {
  final String? referenceId;

  MidtransGoPayAccountMetadata({
    this.referenceId,
  });

  factory MidtransGoPayAccountMetadata.fromJson(Map<String, dynamic> json) =>
      MidtransGoPayAccountMetadata(
        referenceId: json["reference_id"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
      };
}
