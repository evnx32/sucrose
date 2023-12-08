import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_addresses.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_business_detail.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_individual_detail.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_kyc_document.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditCustomerResponse {
  /// Xendit-generated Customer ID. Will start with `cust-...`
  final String? id;

  /// Merchant-provided identifier for the customer
  final String referenceId;

  /// Type of customer.
  /// Supported values: `INDIVIDUAL`, `BUSINESS`
  final String type;

  /// Date of which the account that the shopper had to create/sign up on the merchant’s website
  ///
  /// `Format` YYYY-MM-DD string
  final String? dateOfRegistration;

  /// E-mail address of customer
  ///
  /// `Maximum` length 50 characters
  final String? email;

  /// Mobile number of customer in E.164 format
  ///
  /// `Maximum` length 50 characters
  final String? mobileNumber;

  /// Additional contact number of customer in E.164 format. May be a landline

  /// `Maximum` length 50 characters

  /// `Format` E.164 international standard +(country code)(subscriber number)
  final String? phoneNumber;

  /// Timestamp of customer creation in ISO format
  final DateTime created;

  /// 	Timestamp of customer update in ISO format
  final DateTime updated;

  /// Merchant-provided description for the customer.

  /// `Maximum` length 500 characters
  final String? description;

  /// Hashed phone number

  /// `Maximum` length 255 characters
  final String? hashedPhoneNumber;

  /// Country within which the account that the shopper had to create/sign up on the merchant’s website resides (e.g. accounts created on Shopee SG have SG as the value for this field.

  /// Format ISO 3166-2 Country Code
  final String? domicileOfRegistration;

  /// Array of JSON objects with documents collected for KYC of this customer.
  final List<XenditKycDocument> kycDocuments;

  /// Object containing key-value pairs of additional information about the customer.
  final XenditMetadata? metadata;

  /// Object containing details of the individual. Will be null if type is not `INDIVIDUAL`
  final XenditIndividualDetail? individualDetail;

  /// JSON object containing details of the business. Will be null if type is not `BUSINESS`
  final XenditBusinessDetail? businessDetail;

  /// Array of address JSON objects containing the customer's various address information.
  final List<XenditAddresses>? addresses;

  /// Array of JSON objects with information relating to financial, social media or other accounts associated with the customer. This array can store details for KYC purposes and can support storing of account details for execution of payments within the Xendit API ecosystem.
  final List<XenditIdentityAccountType> identityAccounts;

  /// The Customer Object is a standard data structure to hold information relating to one of your customers. It has the following major components:
  ///
  /// A Type of customer (Individual or Business)
  ///
  /// Basic descriptive details of that customer
  ///
  /// Addresses of the customer
  ///
  /// Identity accounts and KYC documents to prove the legitimacy of the customer
  ///
  /// Other metadata
  ///
  /// When one (or more) customers is returned by endpoints in this section, the response body will contain a Customer Object (or an array of Customer Objects).
  XenditCustomerResponse({
    this.id,
    required this.referenceId,
    required this.type,
    this.dateOfRegistration,
    this.email,
    this.mobileNumber,
    this.phoneNumber,
    required this.created,
    required this.updated,
    this.description,
    this.hashedPhoneNumber,
    this.domicileOfRegistration,
    required this.kycDocuments,
    this.metadata,
    this.individualDetail,
    this.businessDetail,
    this.addresses,
    required this.identityAccounts,
  });

  factory XenditCustomerResponse.fromJson(Map<String, dynamic> json) =>
      XenditCustomerResponse(
        type: json["type"],
        dateOfRegistration: json["date_of_registration"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        phoneNumber: json["phone_number"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
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
}
