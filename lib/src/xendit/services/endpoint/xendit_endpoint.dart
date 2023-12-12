class XenditEndpoint {
  static const String BASE_URL = "https://api.xendit.co";

  // Create Invoice
  String createInvoice() => "$BASE_URL/v2/invoices";

  // Get Invoice by Id
  String getInvoice(String invoiceId) => "$BASE_URL/v2/invoices/$invoiceId";

  // Payment Request
  String paymentRequest() => "$BASE_URL/payment_requests";

  // Payment Method
  String paymentMethod() => "$BASE_URL/v2/payment_methods";

  // Get Payment Request by Id
  String getPaymentRequest(String id) => "$BASE_URL/payment_requests/$id";

  // Get PaymentMethod by Id
  String getPaymentMethod(String id) => "$BASE_URL/v2/payment_methods/$id";

  // Create Customer
  String createCustomer() => "$BASE_URL/customers";

  // Patch Payment Method
  String patchPaymentMethod(String id) => "$BASE_URL/v2/payment_methods/$id";

  // Expire Payment Method
  String expirePaymentMethod(String id) =>
      "$BASE_URL/v2/payment_methods/$id/expire";

  // Refund
  String refund() => "$BASE_URL/refunds";

  // Get Refund by Id
  String getRefund(String id) => "$BASE_URL/refunds/$id";

  // Create Report
  String createReport() => "$BASE_URL/reports";

  // Get Report by Id
  String getReport(String id) => "$BASE_URL/reports/$id";

  // Create QR Code
  String createQRCodePayment() => "$BASE_URL/qr_codes";

  // Get QR Code by Id
  String getQRCodePaymentByID(String id) => "$BASE_URL/qr_codes/$id";

  // Refund QR Code
  String refundQRCodePayment(String id) => "$BASE_URL/qr_codes/$id/refunds";

  // Create Fixed Virtual Account
  String createFixedVirtualAccount() => "$BASE_URL/callback_virtual_accounts";

  // Get Fixed Virtual Account by Id
  String getFixedVirtualAccount(String id) =>
      "$BASE_URL/callback_virtual_accounts/$id";

  // Patch Fixed Virtual Account
  String patchFixedVirtualAccount(String id) =>
      "$BASE_URL/callback_virtual_accounts/$id";

  // Create Ewallet Payment
  String createEwalletPayment() => "$BASE_URL/ewallets/charges";

  // Get Ewallet Payment by Id
  String getEwalletPayment(String id) => "$BASE_URL/ewallets/charges/$id";

  // Refund Ewallet Payment
  String refundEwalletPayment(String id) =>
      "$BASE_URL/ewallets/charges/$id/refunds";

  // Fixed Payment Code
  String createFixedPaymentCode() => "$BASE_URL/fixed_payment_code";

  // Patch Fixed Payment Code
  String patchFixedPaymentCode(String id) => "$BASE_URL/fixed_payment_code/$id";

  // Get Fixed Payment Code by Id
  String getFixedPaymentCode(String id) => "$BASE_URL/fixed_payment_code/$id";
}
