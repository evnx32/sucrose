class XenditEndpoint {
  static const String BASE_URL = "https://api.xendit.co";

  // Create Invoice
  String createInvoice() => "$BASE_URL/v2/invoices";

  // Get Invoice by Id
  String getInvoice(String invoice_id) => "$BASE_URL/v2/invoices/$invoice_id";

  // Qr Payment Request
  String createPaymentRequest() => "$BASE_URL/payment_requests";

  // Get Payment Request by Id
  String getPaymentRequest(String id) => "$BASE_URL/payment_requests/$id";

  // Get List of Payment Request
  String getListPaymentRequest() => "$BASE_URL/payment_requests";

  // Get PaymentMethod by Id
  String getPaymentMethod(String id) => "$BASE_URL/v2/payment_methods/$id";

  // Get List of Payment Method
  String getListPaymentMethod() => "$BASE_URL/v2/payment_methods";

  // Create Customer
  String createCustomer() => "$BASE_URL/customers";
}
