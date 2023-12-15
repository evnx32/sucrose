import 'package:sucrose/src/midtrans/models/entity/midtrans_gopay_partner.dart';

class MidtransGopayAccountRequest {
  /// The payment type. Value: `gopay`.
  final String paymentType;

  /// GoPay partner information.
  final MidtransGopayPartner gopayPartner;

  MidtransGopayAccountRequest({
    required this.paymentType,
    required this.gopayPartner,
  });

  factory MidtransGopayAccountRequest.fromJson(Map<String, dynamic> json) =>
      MidtransGopayAccountRequest(
        paymentType: json["payment_type"],
        gopayPartner: MidtransGopayPartner.fromJson(json["gopay_partner"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_type": paymentType,
        "gopay_partner": gopayPartner.toJson(),
      };
}
