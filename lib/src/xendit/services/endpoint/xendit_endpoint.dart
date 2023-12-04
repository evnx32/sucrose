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
}
