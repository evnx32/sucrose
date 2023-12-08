import 'package:sucrose/src/xendit/models/entity/xendit_report_filter.dart';

class XenditReportResponse {
  final String? id;
  final String? type;
  final String? status;
  final XenditReportFilter? filter;
  final String? format;
  final String? currency;
  final String? businessId;
  final String? url;
  final DateTime? created;
  final DateTime? updated;

  XenditReportResponse({
    this.id,
    this.type,
    this.status,
    this.filter,
    this.format,
    this.currency,
    this.businessId,
    this.url,
    this.created,
    this.updated,
  });

  factory XenditReportResponse.fromJson(Map<String, dynamic> json) =>
      XenditReportResponse(
        id: json["id"],
        type: json["type"],
        status: json["status"],
        filter: XenditReportFilter.fromJson(json["filter"]),
        format: json["format"],
        currency: json["currency"],
        businessId: json["business_id"],
        url: json["url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "status": status,
        "filter": filter?.toJson(),
        "format": format,
        "currency": currency,
        "business_id": businessId,
        "url": url,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
      };
}
