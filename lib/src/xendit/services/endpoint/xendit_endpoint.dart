class XenditEndpoint {
  static const String BASE_URL = "https://api.xendit.co";

  // Invoice
  String createInvoice() => "$BASE_URL/v2/invoices";
  String getInvoice(String invoice_id) => "$BASE_URL/v2/invoices/$invoice_id";

  // Qr Payment Request
  String createPaymentRequest() => "$BASE_URL/payment_requests";

  // Get Payment Request by Id
  String getPaymentRequest(String id) => "$BASE_URL/payment_requests/$id";
}
