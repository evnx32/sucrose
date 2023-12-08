import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_channel_properties.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_actions.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_customer.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_qr_basket.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_shipping_information.dart';

class XenditEwalletPaymentResponse {
  final String? id;
  final String? businessId;
  final String? referenceId;
  final String? status;
  final String? currency;
  final int? chargeAmount;
  final int? captureAmount;
  final int? refundedAmount;
  final String? checkoutMethod;
  final String? channelCode;
  final XenditChannelProperties? channelProperties;
  final XenditActions? actions;
  final bool? isRedirectRequired;
  final String? callbackUrl;
  final DateTime? created;
  final DateTime? updated;
  final String? voidStatus;
  final String? voidedAt;
  final bool? captureNow;
  final String? customerId;
  final XenditCustomer? customer;
  final String? paymentMethodId;
  final String? failureCode;
  final List<XenditBasket>? basket;
  final XenditMetadata? metadata;
  final XenditShippingInformation? shippingInformation;

  XenditEwalletPaymentResponse({
    this.id,
    this.businessId,
    this.referenceId,
    this.status,
    this.currency,
    this.chargeAmount,
    this.captureAmount,
    this.refundedAmount,
    this.checkoutMethod,
    this.channelCode,
    this.channelProperties,
    this.actions,
    this.isRedirectRequired,
    this.callbackUrl,
    this.created,
    this.updated,
    this.voidStatus,
    this.voidedAt,
    this.captureNow,
    this.customerId,
    this.customer,
    this.paymentMethodId,
    this.failureCode,
    this.basket,
    this.metadata,
    this.shippingInformation,
  });

  factory XenditEwalletPaymentResponse.fromJson(Map<String, dynamic> json) =>
      XenditEwalletPaymentResponse(
        id: json["id"],
        businessId: json["business_id"],
        referenceId: json["reference_id"],
        status: json["status"],
        currency: json["currency"],
        chargeAmount: json["charge_amount"],
        captureAmount: json["capture_amount"],
        refundedAmount: json["refunded_amount"],
        checkoutMethod: json["checkout_method"],
        channelCode: json["channel_code"],
        channelProperties: json["channel_properties"] == null
            ? null
            : XenditChannelProperties.fromJson(json["channel_properties"]),
        actions: json["actions"] == null
            ? null
            : XenditActions.fromJson(json["actions"]),
        isRedirectRequired: json["is_redirect_required"],
        callbackUrl: json["callback_url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        voidStatus: json["void_status"],
        voidedAt: json["voided_at"],
        captureNow: json["capture_now"],
        customerId: json["customer_id"],
        customer: json["customer"] == null
            ? null
            : XenditCustomer.fromJson(json["customer"]),
        paymentMethodId: json["payment_method_id"],
        failureCode: json["failure_code"],
        basket: json["basket"] == null
            ? null
            : List<XenditBasket>.from(
                json["basket"]!.map(
                  (x) => XenditBasket.fromJson(x),
                ),
              ),
        metadata: json["metadata"] == null
            ? null
            : XenditMetadata.fromJson(json["metadata"]),
        shippingInformation: json["shipping_information"] == null
            ? null
            : XenditShippingInformation.fromJson(json["shipping_information"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "reference_id": referenceId,
        "status": status,
        "currency": currency,
        "charge_amount": chargeAmount,
        "capture_amount": captureAmount,
        "refunded_amount": refundedAmount,
        "checkout_method": checkoutMethod,
        "channel_code": channelCode,
        "channel_properties": channelProperties?.toJson(),
        "actions": actions?.toJson(),
        "is_redirect_required": isRedirectRequired,
        "callback_url": callbackUrl,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "void_status": voidStatus,
        "voided_at": voidedAt,
        "capture_now": captureNow,
        "customer_id": customerId,
        "customer": customer?.toJson(),
        "payment_method_id": paymentMethodId,
        "failure_code": failureCode,
        "basket": basket == null
            ? null
            : List<dynamic>.from(basket!.map((x) => x.toJson())),
        "metadata": metadata?.toJson(),
        "shipping_information": shippingInformation?.toJson(),
      };
}
