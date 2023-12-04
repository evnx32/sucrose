import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_addresses.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_business_detail.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_individual_detail.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_kyc_document.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditCustomerResponse {
  final String? type;
  final String? dateOfRegistration;
  final String? email;
  final String? mobileNumber;
  final String? phoneNumber;
  final DateTime? created;
  final DateTime? updated;
  final String? description;
  final String? hashedPhoneNumber;
  final String? domicileOfRegistration;
  final List<XenditKycDocument>? kycDocuments;
  final String? id;
  final String? referenceId;
  final XenditMetadata? metadata;
  final XenditIndividualDetail? individualDetail;
  final XenditBusinessDetail? businessDetail;
  final List<XenditAddresses>? addresses;
  final List<XenditIdentityAccountType>? identityAccounts;

  XenditCustomerResponse({
    this.type,
    this.dateOfRegistration,
    this.email,
    this.mobileNumber,
    this.phoneNumber,
    this.created,
    this.updated,
    this.description,
    this.hashedPhoneNumber,
    this.domicileOfRegistration,
    this.kycDocuments,
    this.id,
    this.referenceId,
    this.metadata,
    this.individualDetail,
    this.businessDetail,
    this.addresses,
    this.identityAccounts,
  });

  factory XenditCustomerResponse.fromJson(Map<String, dynamic> json) =>
      XenditCustomerResponse(
        type: json["type"],
        dateOfRegistration: json["date_of_registration"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        phoneNumber: json["phone_number"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        description: json["description"],
        hashedPhoneNumber: json["hashed_phone_number"],
        domicileOfRegistration: json["domicile_of_registration"],
        kycDocuments: json["kyc_documents"] == null
            ? []
            : List<XenditKycDocument>.from(
                json["kyc_documents"]!.map((x) => x)),
        id: json["id"],
        referenceId: json["reference_id"],
        metadata: json["metadata"],
        individualDetail: json["individual_detail"] == null
            ? null
            : XenditIndividualDetail.fromJson(json["individual_detail"]),
        businessDetail: json["business_detail"] == null
            ? null
            : XenditBusinessDetail.fromJson(json["business_detail"]),
        addresses: json["addresses"] == null
            ? []
            : List<XenditAddresses>.from(json["addresses"]!.map((x) => x)),
        identityAccounts: json["identity_accounts"] == null
            ? []
            : List<XenditIdentityAccountType>.from(
                json["identity_accounts"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "date_of_registration": dateOfRegistration,
        "email": email,
        "mobile_number": mobileNumber,
        "phone_number": phoneNumber,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "description": description,
        "hashed_phone_number": hashedPhoneNumber,
        "domicile_of_registration": domicileOfRegistration,
        "kyc_documents": kycDocuments == null
            ? []
            : List<dynamic>.from(kycDocuments!.map((x) => x)),
        "id": id,
        "reference_id": referenceId,
        "metadata": metadata?.toJson() ?? {},
        "individual_detail": individualDetail?.toJson(),
        "business_detail": businessDetail?.toJson() ?? {},
        "addresses": addresses == null
            ? []
            : List<XenditAddresses>.from(addresses!.map((x) => x)),
        "identity_accounts": identityAccounts == null
            ? []
            : List<XenditIdentityAccountType>.from(
                identityAccounts!.map((x) => x)),
      };
}
