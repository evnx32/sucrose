class MidtransStatusMessageResponse {
  final String? statusMessage;

  MidtransStatusMessageResponse({
    this.statusMessage,
  });

  factory MidtransStatusMessageResponse.fromJson(Map<String, dynamic> json) =>
      MidtransStatusMessageResponse(
        statusMessage: json["status_message"],
      );

  Map<String, dynamic> toJson() => {
        "status_message": statusMessage,
      };
}
