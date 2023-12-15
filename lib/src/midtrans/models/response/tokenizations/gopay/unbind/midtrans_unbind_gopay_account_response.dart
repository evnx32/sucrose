class MidtransUnbindGoPayAccountResponse {
  final String? statusCode;
  final String? paymentType;
  final String? accountId;
  final String? accountStatus;

  MidtransUnbindGoPayAccountResponse({
    this.statusCode,
    this.paymentType,
    this.accountId,
    this.accountStatus,
  });

  factory MidtransUnbindGoPayAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      MidtransUnbindGoPayAccountResponse(
        statusCode: json["status_code"],
        paymentType: json["payment_type"],
        accountId: json["account_id"],
        accountStatus: json["account_status"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "payment_type": paymentType,
        "account_id": accountId,
        "account_status": accountStatus,
      };
}
