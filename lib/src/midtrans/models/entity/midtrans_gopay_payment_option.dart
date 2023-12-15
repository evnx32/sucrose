import 'package:sucrose/src/midtrans/models/entity/midtrans_gopay_balance.dart';
import 'package:sucrose/src/midtrans/models/response/tokenizations/gopay/midtrans_get_gopay_account_response.dart';

class MidtransGopayPaymentOption {
  /// The name of the payment option.
  final String? name;

  /// Whether the payment option is active.
  final bool? active;

  /// The balance of the payment option.
  final MidtransGopayBalance? balance;

  /// Additional data from the specific payment provider, that is, GoPay.
  final PaymentOptionMetadata? metadata;

  /// The token of the payment option.
  final String? token;

  MidtransGopayPaymentOption({
    this.name,
    this.active,
    this.balance,
    this.metadata,
    this.token,
  });

  factory MidtransGopayPaymentOption.fromJson(Map<String, dynamic> json) =>
      MidtransGopayPaymentOption(
        name: json["name"],
        active: json["active"],
        balance: json["balance"] == null
            ? null
            : MidtransGopayBalance.fromJson(json["balance"]),
        metadata: json["metadata"] == null
            ? null
            : PaymentOptionMetadata.fromJson(json["metadata"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "active": active,
        "balance": balance?.toJson(),
        "metadata": metadata?.toJson(),
        "token": token,
      };
}
