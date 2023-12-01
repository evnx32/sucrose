class XenditFee {
  final String? type;
  final int? value;

  XenditFee({
    this.type,
    this.value,
  });

  factory XenditFee.fromJson(Map<String, dynamic> json) => XenditFee(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}
