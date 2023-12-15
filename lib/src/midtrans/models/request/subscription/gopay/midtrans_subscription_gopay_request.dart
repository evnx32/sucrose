import 'package:sucrose/src/midtrans/models/entity/midtrans_subscription_account_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/subscription_props/midtrans_subscription_gopay_props.dart';
import 'package:sucrose/src/midtrans/models/entity/subscription_props/midtrans_subscription_schedule_props.dart';

class MidtransSubscriptionGopayRequest {
  ///	Details of the subscription schedule.
  final MidtransSubscriptionScheduleProps schedule;

  /// Details of the customer.
  final MidtransSubscriptionCustomerDetails? customerDetails;

  /// Details of the payment option.
  final MidtransSubscriptionGopayProps gopay;

  /// Name of the subscription. It is used to generate order ID for the transaction. Generated order ID will contain subscription name and 10 digits of unique number.
  ///
  /// Note: Allowed symbols are dash(-), underscore(_), tilde (~), and dot (.).
  final String name;

  /// The amount to be charged to the customer.
  ///
  /// Note: Do not use decimal.
  final String amount;

  /// ISO-4217 representation of three-letter alphabetic currency code. Value: `IDR`.
  ///
  /// Note: Currently only `IDR` is supported.
  final String currency;

  /// Saved payment token. [Click Here for more information](https://docs.midtrans.com/reference/get-pay-account).
  final String token;

  MidtransSubscriptionGopayRequest({
    required this.schedule,
    this.customerDetails,
    required this.gopay,
    required this.name,
    required this.amount,
    required this.currency,
    required this.token,
  });

  factory MidtransSubscriptionGopayRequest.fromJson(
          Map<String, dynamic> json) =>
      MidtransSubscriptionGopayRequest(
        schedule: MidtransSubscriptionScheduleProps.fromJson(json["schedule"]),
        customerDetails: json["customer_details"] == null
            ? null
            : MidtransSubscriptionCustomerDetails.fromJson(
                json["customer_details"]),
        gopay: MidtransSubscriptionGopayProps.fromJson(json["gopay"]),
        name: json["name"],
        amount: json["amount"],
        currency: json["currency"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "schedule": schedule.toJson(),
        "customer_details": customerDetails?.toJson(),
        "gopay": gopay.toJson(),
        "name": name,
        "amount": amount,
        "currency": currency,
        "token": token,
      };
}
