class MidtransOTCProps {
  /// The name of the convenience store.
  final String? store;

  /// Label displayed in Indomaret POS.
  final String? message;

  /// Customizable first row of text on the Alfamart printed receipt.
  final String? alfamartFreeText1;

  /// Customizable second row of text on the Alfamart printed receipt.
  final String? alfamartFreeText2;

  /// Customizable second row of text on the Alfamart printed receipt.
  final String? alfamartFreeText3;

  /// Details of the convenience store.
  MidtransOTCProps({
    this.store,
    this.message,
    this.alfamartFreeText1,
    this.alfamartFreeText2,
    this.alfamartFreeText3,
  });

  factory MidtransOTCProps.fromJson(Map<String, dynamic> json) =>
      MidtransOTCProps(
        store: json["store"],
        message: json["message"],
        alfamartFreeText1: json["alfamart_free_text_1"],
        alfamartFreeText2: json["alfamart_free_text_2"],
        alfamartFreeText3: json["alfamart_free_text_3"],
      );

  Map<String, dynamic> toJson() => {
        "store": store,
        "message": message,
        "alfamart_free_text_1": alfamartFreeText1,
        "alfamart_free_text_2": alfamartFreeText2,
        "alfamart_free_text_3": alfamartFreeText3,
      };
}
