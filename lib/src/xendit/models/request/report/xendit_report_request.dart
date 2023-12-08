import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_report_filter.dart';

class XenditReportRequest {
  /// The type of report that will be generated.
  ///
  /// `BALANCE_HISTORY` Report that shows the historical line per line of your balance. This report is equivalent to Balance History tab in Dashboard. See [Balance History Report](https://developers.xendit.co/api-reference/#balance-history-report) for more information.
  ///
  /// `TRANSACTIONS` Report that shows history of transaction. This report is equivalent to Transactions tab in Dashboard. See [Transactions Report](https://developers.xendit.co/api-reference/#transactions-report) for more information.
  ///
  /// `UPCOMING_TRANSACTIONS`Report that shows the list of upcoming (incoming & outgoing) transactions. This report is equivalent to Upcoming Transaction tab in Dashboard.
  final XenditReportType type;

  /// Filtering that are applied to report.
  final XenditReportFilter filter;

  /// The format of the report.
  ///
  /// Available format is `CSV`.
  final String? format;

  /// The currency to filter.
  ///
  /// See our [supported currencies](https://docs.xendit.co/credit-cards/supported-currencies).
  ///
  /// Default is `IDR`.
  final String currency;

  XenditReportRequest({
    required this.type,
    required this.filter,
    required this.currency,
    this.format,
  });

  factory XenditReportRequest.fromJson(Map<String, dynamic> json) =>
      XenditReportRequest(
        type: XenditReportType.values
            .firstWhere((element) => element.name == json["type"]),
        filter: XenditReportFilter.fromJson(json["filter"]),
        format: json["format"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "type": type.name,
        "filter": filter.toJson(),
        "currency": currency,
        if (format != null) "format": format,
      };
}
