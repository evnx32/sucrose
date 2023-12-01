import 'package:sucrose/sucrose.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() async {
  final sucrose = Sucrose.initXendit(
      xenditApiKey:
          "xnd_development_QvnIv5ehrZAAxnDkzzFNRI4go9bVVxRPTyYT3uvlznK9dXitjGLFJuRvJL8BvnA");

  // final response = await sucrose.xendit.createQrPaymentRequest(
  //   XenditQrRequest(
  //     amount: 10000,
  //     currency: XenditQRCurrency.IDR,
  //     paymentMethod: XenditQRPaymentMethod(
  //       reusability: XenditReusablePaymentMethod.ONE_TIME_USE,
  //       qrCode: XenditQrCodeProps(
  //         channelCode: XenditQRChannelCode.DANA,
  //       ),
  //     ),
  //     description: "",
  //     metadata: XenditMetadata(
  //       metadata: {
  //         "test": "test",
  //       },
  //     ),
  //   ),
  // );

  final response = await sucrose.xendit.createEwalletOTPPaymentRequest(
    XenditEwalletRequest(
      amount: 6666,
      currency: XenditEWalletCurrency.IDR,
      paymentMethod: XenditEwalletPaymentMethod(
        reusability: XenditReusablePaymentMethod.ONE_TIME_USE,
        ewallet: XenditEwalletProps(
          channelCode: XenditEWalletCode.DANA,
          channelProperties: XenditEwalletChannelProperties(
            successReturnUrl: "https://redirect.me/goodstuff",
          ),
        ),
      ),
      description: "",
      metadata: XenditMetadata(
        metadata: {
          "test": "test",
        },
      ),
    ),
  );

  // final response = await sucrose.xendit.createVirtualAccountPaymentRequest(
  //   XenditVirtualAccountRequest(
  //     currency: XenditVACurrency.IDR,
  //     paymentMethod: XenditVAPaymentMethod(
  //       reusability: XenditReusablePaymentMethod.ONE_TIME_USE,
  //       virtualAccount: XenditVirtualAccountProps(
  //         channelCode: XenditVAccountCode.PERMATA,
  //         channelProperties: XenditVAChannelProperties(
  //           customerName: "idk nahui",
  //         ),
  //       ),
  //     ),
  //     description: "",
  //     metadata: XenditMetadata(
  //       metadata: {
  //         "test": "test",
  //       },
  //     ),
  //   ),
  // );

  // final response = await artic.xendit
  //     .getPaymentRequest("pr-bf2899f5-999e-42c1-b102-954a662333ea");

  Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  logger.i(response.toJson());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
