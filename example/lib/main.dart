import 'package:sucrose/sucrose.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() async {
  final sucrose = Sucrose.initMidtrans(
    midtransApiKey: "YOUR API KEY",
    environment: MidtransEnvironment.SANDBOX,
    debug: true,
  );

  Logger logger = Logger(
    printer: PrettyPrinter(),
  );
  try {
    final response = await sucrose.midtrans.createSnapTransaction(
      request: MidtransSnapTransactionRequest(
        transactionDetails: MidtransTransactionDetail(
          orderId: "Inv-${DateTime.now().millisecondsSinceEpoch}",
          grossAmount: 12500,
        ),
        itemDetails: [
          MidtransItemDetail(
            id: "021930129031",
            name: "Steam Wallet IDR 12K",
            price: 12500,
            quantity: 1,
          ),
        ],
        customerDetails: MidtransCustomerDetails(
          email: "test@mail.com",
          firstName: "Test",
          lastName: "Test",
          phone: "08123456789",
          shippingAddress: MidtransShippingAddress(
            address: "Jalan Teknologi Indonesia",
            city: "Jakarta",
            countryCode: "IDN",
            firstName: "Test",
            lastName: "Test",
            phone: "08123456789",
            postalCode: "12345",
          ),
          billingAddress: MidtransBillingAddress(
            address: "Jalan Teknologi Indonesia",
            city: "Jakarta",
            countryCode: "IDN",
            firstName: "Test",
            lastName: "Test",
            phone: "08123456789",
            postalCode: "12345",
          ),
        ),
      ),
    );
    logger.i(response.toJson());
  } catch (e) {
    if (e is MidtransException) {
      logger.e(e.statusCode);
      logger.e(e.statusMessage);
      logger.e(e.validationMessages);
    } else {
      logger.e(e.toString());
    }
  }

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // final controller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..setBackgroundColor(const Color(0x00000000))
  //   ..setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (int progress) {
  //         // Update loading bar.
  //       },
  //       onPageStarted: (String url) {},
  //       onPageFinished: (String url) {},
  //       onWebResourceError: (WebResourceError error) {},
  //       onNavigationRequest: (NavigationRequest request) {
  //         if (request.url.startsWith('https://www.youtube.com/')) {
  //           return NavigationDecision.prevent;
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   )
  //   ..loadRequest(Uri.parse(
  //       'https://app.sandbox.midtrans.com/snap/v3/redirection/31ccb075-2c7e-4af8-a0b1-1f8ac1dea6a6'));
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text("Hello"))),
    );
  }
}
