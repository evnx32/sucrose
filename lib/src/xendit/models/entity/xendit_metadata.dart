class XenditMetadata {
  Map<String, dynamic> metadata;

  XenditMetadata({
    required this.metadata,
  });

  factory XenditMetadata.fromJson(Map<String, dynamic> json) => XenditMetadata(
        metadata: json,
      );

  Map<String, dynamic> toJson() => metadata;
}
