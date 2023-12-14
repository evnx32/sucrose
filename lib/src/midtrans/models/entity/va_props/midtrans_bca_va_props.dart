import 'package:sucrose/src/midtrans/models/entity/midtrans_inquiry.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_payment.dart';

class MidtransBcaVaProps {
  /// Custom VA number assigned by you. If shorter than minimum then Midtrans will add trailing 0s as most significant bits. If longer than maximum then Midtrans will trim the remaining least significant bits.
  ///
  /// `BCA VA`: Accepts 6-11 digits
  final String? vaNumber;

  /// List of free texts.
  ///
  /// Note: Right now only used for BCA VA.
  final MidtransFreeText? freeText;

  /// Charge details using bank transfer.
  MidtransBcaVaProps({
    this.vaNumber,
    this.freeText,
  });

  factory MidtransBcaVaProps.fromJson(Map<String, dynamic> json) =>
      MidtransBcaVaProps(
        vaNumber: json["va_number"],
        freeText: json["free_text"] == null
            ? null
            : MidtransFreeText.fromJson(json["free_text"]),
      );

  Map<String, dynamic> toJson() => {
        "bank": "bca",
        "va_number": vaNumber,
        "free_text": freeText?.toJson(),
      };
}

class MidtransFreeText {
  final List<MidtransInquiry>? inquiry;
  final List<MidtransPayment>? payment;

  MidtransFreeText({
    this.inquiry,
    this.payment,
  });

  factory MidtransFreeText.fromJson(Map<String, dynamic> json) =>
      MidtransFreeText(
        inquiry: json["inquiry"] == null
            ? []
            : List<MidtransInquiry>.from(
                json["inquiry"]!.map((x) => MidtransInquiry.fromJson(x))),
        payment: json["payment"] == null
            ? []
            : List<MidtransPayment>.from(
                json["payment"]!.map((x) => MidtransPayment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "inquiry": inquiry == null
            ? []
            : List<dynamic>.from(inquiry!.map((x) => x.toJson())),
        "payment": payment == null
            ? []
            : List<dynamic>.from(payment!.map((x) => x.toJson())),
      };
}
