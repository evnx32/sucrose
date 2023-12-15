import 'package:sucrose/src/midtrans/models/entity/midtrans_gopay_payment_option.dart';

class MidtransGetGoPayAccountMetadata {
  /// Additional data from the specific payment provider, that is, GoPay.
  final List<MidtransGopayPaymentOption>? paymentOptions;

  MidtransGetGoPayAccountMetadata({
    this.paymentOptions,
  });

  factory MidtransGetGoPayAccountMetadata.fromJson(Map<String, dynamic> json) =>
      MidtransGetGoPayAccountMetadata(
        paymentOptions: json["payment_options"] == null
            ? []
            : List<MidtransGopayPaymentOption>.from(json["payment_options"]!
                .map((x) => MidtransGopayPaymentOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "payment_options": paymentOptions == null
            ? []
            : List<dynamic>.from(paymentOptions!.map((x) => x.toJson())),
      };
}
