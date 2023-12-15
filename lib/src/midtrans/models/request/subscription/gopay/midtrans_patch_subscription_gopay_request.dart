import 'package:sucrose/src/midtrans/models/entity/subscription_props/midtrans_patch_subscription_schedule.dart';
import 'package:sucrose/src/midtrans/models/entity/subscription_props/midtrans_subscription_gopay_props.dart';
import 'package:sucrose/src/midtrans/models/entity/subscription_props/midtrans_subscription_retry_schedule.dart';

class MidtransPatchSubscriptionGopayRequest {
  /// Subscription name specified by you.
  ///
  /// Note: Allowed symbols are dash(-), underscore(_), tilde (~), and dot (.).
  final String name;

  /// Amount specified by you for recurring charge.
  final String amount;

  /// ISO-4217 representation of three-letter alphabetic currency code. Value: `IDR`.
  ///
  /// Note: Currently only `IDR` is supported.
  final String currency;

  /// Saved payment token.
  final String token;

  /// Update an ongoing subscription's schedule, or reactivate an expired subscription by updating the schedule.
  final MidtransPatchSubscriptionSchedule? schedule;

  /// Update an ongoing subscription's retry schedule over failed charge.
  final MidtransSubscriptionRetrySchedule? retrySchedule;

  /// GoPay subscription information.
  final MidtransSubscriptionGopayProps? gopay;

  MidtransPatchSubscriptionGopayRequest({
    required this.name,
    required this.amount,
    required this.currency,
    required this.token,
    this.schedule,
    this.retrySchedule,
    this.gopay,
  });

  factory MidtransPatchSubscriptionGopayRequest.fromJson(
          Map<String, dynamic> json) =>
      MidtransPatchSubscriptionGopayRequest(
        name: json["name"],
        amount: json["amount"],
        currency: json["currency"],
        token: json["token"],
        schedule: json["schedule"] == null
            ? null
            : MidtransPatchSubscriptionSchedule.fromJson(json["schedule"]),
        retrySchedule: json["retry_schedule"] == null
            ? null
            : MidtransSubscriptionRetrySchedule.fromJson(
                json["retry_schedule"]),
        gopay: json["gopay"] == null
            ? null
            : MidtransSubscriptionGopayProps.fromJson(json["gopay"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "currency": currency,
        "token": token,
        "schedule": schedule?.toJson(),
        "retry_schedule": retrySchedule?.toJson(),
        "gopay": gopay?.toJson(),
      };
}
