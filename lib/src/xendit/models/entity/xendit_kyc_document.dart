import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditKycDocument {
  final String? country;
  final XenditKycDocumentType? type;
  final String? subType;
  final String? documentName;
  final String? documentNumber;
  final String? expiresAt;
  final String? holderName;
  final List<String>? documentImages;

  XenditKycDocument({
    this.country,
    this.type,
    this.subType,
    this.documentName,
    this.documentNumber,
    this.expiresAt,
    this.holderName,
    this.documentImages,
  });

  factory XenditKycDocument.fromJson(Map<String, dynamic> json) =>
      XenditKycDocument(
        country: json["country"],
        type: json["type"],
        subType: json["sub_type"],
        documentName: json["document_name"],
        documentNumber: json["document_number"],
        expiresAt: json["expires_at"],
        holderName: json["holder_name"],
        documentImages: json["document_images"] == null
            ? []
            : List<String>.from(json["document_images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "type": type?.name,
        "sub_type": subType,
        "document_name": documentName,
        "document_number": documentNumber,
        "expires_at": expiresAt,
        "holder_name": holderName,
        "document_images": documentImages == null
            ? []
            : List<dynamic>.from(documentImages!.map((x) => x)),
      };
}
