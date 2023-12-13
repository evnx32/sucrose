import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/payment_method_props/xendit_qr_code_props.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_billing_information.dart';

class XenditQRPaymentMethod {
  /// Describes whether or not the payment method can be reused for subsequent payments without going through the same linking process again.
  final XenditReusablePaymentMethod reusability;

  /// For type=`QR_CODE`, this contains the necessary information to describe a QR Code payment method. This will be null otherwise.
  ///
  /// Please refer to QR Object for more parameter details.
  final XenditQrCodeProps qrCode;

  /// Object containing the payor's billing address. This will be null if not applicable.
  final XenditBillingInformation? billingInformation;

  /// Object that contains the required information to perform payments with QR code
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
