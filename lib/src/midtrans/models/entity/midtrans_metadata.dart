class MidtransMetadata {
  /// Additional object that may be used for additional item attributes
  Map<String, dynamic> metadata;

  /// Object of additional information as provided in customer creation
  MidtransMetadata({
    required this.metadata,
  });

  factory MidtransMetadata.fromJson(Map<String, dynamic> json) =>
      MidtransMetadata(
        metadata: json,
      );

  Map<String, dynamic> toJson() => metadata;
}
