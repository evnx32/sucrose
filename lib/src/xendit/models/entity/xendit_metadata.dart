class XenditMetadata {
  /// Additional object that may be used for additional item attributes
  Map<String, dynamic> metadata;

  /// Object of additional information as provided in customer creation
  XenditMetadata({
    required this.metadata,
  });

  factory XenditMetadata.fromJson(Map<String, dynamic> json) => XenditMetadata(
        metadata: json,
      );

  Map<String, dynamic> toJson() => metadata;
}
