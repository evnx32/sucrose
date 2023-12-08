import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_customer.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_ewallet.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditEwalletLinkingRequest {
  /// Merchant-provided identifier for this payment request.
  ///
  /// If none is provided, Xendit will randomly generate a unique reference_id.
  ///
  /// This is optional
  final String? referenceId;

  /// Type of account to be linked.
  ///
  /// This is required
  final XenditIdentityAccountType type;

  /// Whether the account can be reused for future payments.
  ///
  /// This is required
  final XenditReusablePaymentMethod reusability;

  /// Country of the account to be linked.
  ///
  /// This is required
  final String country;

  /// ID of the customer object to which the account token will be linked to. Call Tokenized - Create Customer to generate Customer ID
  ///
  /// This is required if the customer object is not provided
  final String? customerId;

  /// A customer object to skip Create Customer URL endpoint process. This object is required for all if the customer_id is null.
  ///
  /// This is required if the customer_id is not provided
  final XenditCustomer? customer;

  /// The ewallet object that contains the channel code and another properties.
  ///
  /// This is required ofc
  final XenditEwallet ewallet;

  /// Description of the payment request that will be shown to the user (e.g. on invoices).
  ///
  /// This is optional
  final String? description;

  /// Object containing key-value pairs of additional information that will be included in the response if present.
  ///
  /// This is optional, for more info, see https://developers.xendit.co/api-reference/
  final XenditMetadata? metadata;

  ///   /// Object that contains the required information to perform linking ewallet
  XenditEwalletLinkingRequest({
    this.referenceId,
    required this.type,
    required this.reusability,
    required this.country,
    this.customerId,
    this.customer,
    required this.ewallet,
    this.description,
    this.metadata,
  });

  factory XenditEwalletLinkingRequest.fromJson(Map<String, dynamic> json) =>
      XenditEwalletLinkingRequest(
        referenceId: json["reference_id"],
        type: XenditIdentityAccountType.values.firstWhere(
          (element) => element.name == json["type"],
        ),
        reusability: XenditReusablePaymentMethod.values.firstWhere(
          (element) => element.name == json["reusability"],
        ),
        country: json["country"],
        customerId: json["customer_id"],
        customer: json["customer"],
        ewallet: XenditEwallet.fromJson(json["ewallet"]),
        description: json["description"],
        metadata: json["metadata"],
      );

  Map<String, dynamic> toJson() => {
        if (referenceId != null) "reference_id": referenceId,
        "type": type.name,
        "reusability": reusability.name,
        "country": country,
        if (customerId != null) "customer_id": customerId,
        if (customer != null) "customer": customer?.toJson(),
        "ewallet": ewallet.toJson(),
        if (description != null) "description": description,
        if (metadata != null) "metadata": metadata?.toJson(),
      };
}
