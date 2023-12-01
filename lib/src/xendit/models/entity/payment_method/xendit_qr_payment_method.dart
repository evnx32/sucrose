import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/payment_method_props/xendit_qr_code_props.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_billing_information.dart';

class XenditQRPaymentMethod {
  final XenditReusablePaymentMethod reusability;
  final XenditQrCodeProps qrCode;
  final XenditBillingInformation? billingInformation;

  XenditQRPaymentMethod({
    required this.reusability,
    required this.qrCode,
    this.billingInformation,
  });

  Map<String, dynamic> toJson() => {
        "type": "QR_CODE",
        "reusability": reusability.name,
        "qr_code": qrCode.toJson(),
        if (billingInformation != null)
          "billing_information": billingInformation!.toJson(),
      };
}
