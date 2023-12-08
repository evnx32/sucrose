class XenditReportFilter {
  /// The start time of the transaction to be filtered.
  ///
  /// If not specified, from is 24 hours before current time
  final DateTime from;

  /// The end time of the transaction to be filtered.
  ///
  /// If not specified, `to` is current time. This means if both `from` and `to` is not specified, the report will generate the last 24 hours of data.
  final DateTime to;

  XenditReportFilter({
    required this.from,
    required this.to,
  });

  factory XenditReportFilter.fromJson(Map<String, dynamic> json) =>
      XenditReportFilter(
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "from": '${from.toIso8601String().substring(0, 19)}Z',
        "to": '${to.toIso8601String().substring(0, 19)}Z',
      };
}
