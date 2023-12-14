class MidtransException {
  /// Status code from Midtrans API
  final String? statusCode;

  /// Status message from Midtrans API
  final String? statusMessage;

  /// ID from Midtrans API
  final String? id;

  final String? validationMessages;

  /// MidtransException
  ///
  /// `statusCode` is the status code from Midtrans API
  ///
  /// `statusMessage` is the status message from Midtrans API
  ///
  /// `id` is the ID from Midtrans API
  MidtransException({
    this.statusCode,
    this.statusMessage,
    this.validationMessages,
    this.id,
  });

  factory MidtransException.fromJson(Map<String, dynamic> json) =>
      MidtransException(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        validationMessages: json["validation_messages"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status_message": statusMessage,
        "validation_messages": validationMessages,
        "id": id,
      };
}
