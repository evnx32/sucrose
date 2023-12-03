class XenditEndpoint {
  static const String BASE_URL = "https://api.xendit.co";

  // Create Invoice
  String createInvoice() => "$BASE_URL/v2/invoices";

  // Get Invoice by Id
  String getInvoice(String invoiceId) => "$BASE_URL/v2/invoices/$invoiceId";

  // Qr Payment Request
  String paymentRequest() => "$BASE_URL/payment_requests";

  // Get Payment Request by Id
  String getPaymentRequest(String id) => "$BASE_URL/payment_requests/$id";

  // Get PaymentMethod by Id
  String getPaymentMethod(String id) => "$BASE_URL/v2/payment_methods/$id";

  // Get List of Payment Method
  String getListPaymentMethod() => "$BASE_URL/v2/payment_methods";

  // Create Customer
  String createCustomer() => "$BASE_URL/customers";
}
