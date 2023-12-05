import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditKycDocument {
  /// Issuing country of the document
  ///
  /// `Format` ISO 3166-2 Country Code
  final String country;

  /// Generic ID type
  final XenditKycDocumentType type;

  /// Specific ID type for `IDENTITY_CARD` types.
  final String? subType;

  /// Free text description of the type of document (e.g., NIB, SIUP, AKTA)
  ///
  /// Maximum length 255 characters
  final String? documentName;

  /// Unique alphanumeric identity document number or code
  ///
  /// Maximum length 255 characters
  final String? documentNumber;

  ///  Expiry date, if relevant.
  ///
  /// Format YYYY-MM-DD string
  final String? expiresAt;

  ///Free text to capture the full name(s) of the individual or business as defined on the document, if relevant
  ///
  /// Maximum length 255 characters
  final String? holderName;

  /// Array of file ids returned from uploads to the [files endpoint](https://developers.xendit.co/api-reference/#files), representing images of the front/back of the document, in png/jpg/jpeg/pdf format
  final List<String> documentImages;

  /// Array of JSON objects with documents collected for KYC of this customer.
  XenditKycDocument({
    required this.country,
    required this.type,
    this.subType,
    this.documentName,
    this.documentNumber,
    this.expiresAt,
    this.holderName,
    required this.documentImages,
  });

  factory XenditKycDocument.fromJson(Map<String, dynamic> json) =>
      XenditKycDocument(
        country: json["country"],
        type: XenditKycDocumentType.values
            .firstWhere((element) => element.name == json["type"]),
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
        "type": type.name,
        if (subType != null) "sub_type": subType,
        if (documentName != null) "document_name": documentName,
        if (documentNumber != null) "document_number": documentNumber,
        if (expiresAt != null) "expires_at": expiresAt,
        if (holderName != null) "holder_name": holderName,
        "document_images": List<String>.from(documentImages.map((x) => x)),
      };
}
