import 'dart:convert';

import 'package:sucrose/sucrose.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() async {
  final sucrose = Sucrose.initXendit(
    xenditApiKey:
        "xnd_development_QvnIv5ehrZAAxnDkzzFNRI4go9bVVxRPTyYT3uvlznK9dXitjGLFJuRvJL8BvnA",
    debug: true,
  );

  Logger logger = Logger(
    printer: PrettyPrinter(),
  );
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

  // final response = await sucrose.xendit.createEwalletOTPPaymentRequest(
  //   XenditEwalletRequest(
  //     amount: 6666,
  //     currency: XenditEWalletCurrency.IDR,
  //     paymentMethod: XenditEwalletPaymentMethod(
  //       reusability: XenditReusablePaymentMethod.ONE_TIME_USE,
  //       ewallet: XenditEwalletProps(
  //         channelCode: XenditEWalletCode.DANA,
  //         channelProperties: XenditEwalletChannelProperties(
  //           successReturnUrl: "https://redirect.me/goodstuff",
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

  // try {
  //   final response = await sucrose.xendit
  //       .getMethodPaymentById(id: "pm-fed467b7-7bef-43e3-b615-c3c1c61d8cbd");
  //   logger.i(jsonEncode(response.toJson()));
  // } catch (e) {
  //   if (e is XenditException) {
  //     logger.e("XenditException: ${e.errorCode}");
  //     logger.e("XenditException: ${e.message}");
  //     logger.e("XenditException: ${e.errors}");
  //   } else {
  //     logger.e("Exception: ${e.toString()}");
  //   }
  // }

  // // final response = await sucrose.xendit.getListMethodPayment();

  // final response = await sucrose.xendit
  //     .createInvoice(
  //   request: XenditInvoiceRequest(
  //     externalId: "ref 13123213",
  //     amount: 10000,
  //     description: "wkkwkw",
  //     payerEmail: "hello@mail.com",
  //     items: [
  //       XenditInvoiceItem(
  //         name: "item 1",
  //         price: 10000,
  //         quantity: 1,
  //         category: "meow",
  //         url: "https://google.com",
  //       ),
  //     ],
  //   ),
  // )
  //     .catchError(
  //   (error) {
  //     if (error is XenditException) {
  //       print(error.message.toString());
  //     } else {
  //       print(error.toString());
  //     }
  //   },
  // );

  // try {
  //   final response = await sucrose.xendit.createCustomer(
  //     customer: XenditCustomer(
  //       referenceId: "ref-${DateTime.now().millisecondsSinceEpoch}",
  //       type: XenditCustomerType.INDIVIDUAL,
  //       individualDetail: XenditIndividualDetail(
  //         givenNames: "hello",
  //         surname: "nahui",
  //         gender: XenditCustomerGender.MALE,
  //       ),
  //       // businessDetail: XenditBusinessDetail(
  //       //   businessType: XenditBusinessType.NON_PROFIT,
  //       //   businessName: "YOUR FCKIN COMPANY",
  //       // ),
  //       email: "helloworld@mail.com",
  //       mobileNumber: "+628774494404",
  //     ),
  //   );
  //   logger.i(jsonEncode(response.toJson()));
  // } on XenditException catch (e) {
  //   logger.e("XenditException: ${e.error.toString()}");
  // } catch (e) {
  //   logger.e("Exception: ${e.toString()}");
  // }

  // try {
  //   final response = await sucrose.xendit.initializeLinkingEwallet(
  //      request: XenditEwalletLinkingRequest(
  //       country: "ID",
  //       type: XenditIdentityAccountType.EWALLET,
  //       reusability: XenditReusablePaymentMethod.MULTIPLE_USE,
  //       customerId: "cust-eb5e273b-b054-498a-879a-79bf48a4c2c5",
  //       ewallet: XenditEwallet(
  //         channelCode: XenditEWalletCode.DANA,
  //         channelProperties: XenditEwalletChannelProperties(
  //             successReturnUrl: "https://redirect.me/goodstuff",
  //             failureReturnUrl: "https://redirect.me/badstuff"),
  //       ),
  //       description: "Linking ewallet",
  //       metadata: XenditMetadata(
  //         metadata: {
  //           "Hello": "World",
  //         },
  //       ),
  //     ),
  //   );
  //   logger.i(jsonEncode(response.toJson()));
  // } on XenditException catch (e) {
  //   logger.e("XenditException: ${e.error.toString()}");
  // } catch (e) {
  //   logger.e("Exception: ${e.toString()}");
  // }

  // try {
  //   final response = await sucrose.xendit.updateEwalletPaymentMethod(
  //     "pm-edec2670-13b7-4eae-8bf6-a5abb74c3263",
  //     XenditUpdateEwalletRequest(
  //       status: XenditPaymentMethodStatus.ACTIVE,
  //     ),
  //   );
  //   logger.i(jsonEncode(response.toJson()));
  // } on XenditException catch (e) {
  //   logger.e("XenditException: ${e.error.toString()}");
  // } catch (e) {
  //   logger.e("Exception: ${e.toString()}");
  // }

  // try {
  //   final response = await sucrose.xendit
  //       .expirePaymentMethod(id: "pm-692906a3-9071-43f5-9278-c828f321f555");
  //   logger.i(jsonEncode(response.toJson()));
  // } catch (e) {
  //   if (e is XenditException) {
  //     logger.e("XenditException: ${e.errorCode}");
  //     logger.e("XenditException: ${e.message}");
  //     logger.e("XenditException: ${e.errors}");
  //   } else {
  //     logger.e("Exception: ${e.toString()}");
  //   }
  // }

  // try {
  //   final response = await sucrose.xendit.initializeLinkingAndPay(
  //     request: XenditInitializeAndPayRequest(
  //       currency: "IDR",
  //       amount: 12000,
  //       country: "ID",
  //       customerId: "cust-1248309d-e280-4396-aa4a-6665916919f9",
  //       paymentMethod: XenditPaymentMethod(
  //         type: XenditPaymentMethodType.EWALLET,
  //         reusability: XenditReusablePaymentMethod.ONE_TIME_USE,
  //         ewallet: XenditEwallet(
  //           channelCode: XenditEWalletCode.DANA,
  //           channelProperties: XenditEwalletChannelProperties(
  //             successReturnUrl: "https://google.com",
  //             failureReturnUrl: "https://google.com",
  //           ),
  //         ),
  //       ),
  //       description: "test payment subsequent",
  //       channelProperties: XenditChannelProperties(
  //         successReturnUrl: "https://redirect.me/goodstuff",
  //         failureReturnUrl: "https://redirect.me/badstuff",
  //       ),
  //       metadata: XenditMetadata(
  //         metadata: {
  //           "SubSequent": "test",
  //         },
  //       ),
  //     ),
  //   );
  //   // LOG JSON FORMAT
  //   logger.i(response.toJson());
  // } catch (e) {
  //   if (e is XenditException) {
  //     logger.e("XenditException: ${e.errorCode}");
  //     logger.e("XenditException: ${e.message}");
  //     logger.e("XenditException: ${e.errors}");
  //   } else {
  //     logger.e("Exception: ${e.toString()}");
  //   }
  // }

  // try {
  //   final response = await sucrose.xendit.getReportById(
  //     id: "report_7cfe747c-1cb5-4ba9-b24a-5aa011827c02",
  //   );

  //   logger.i(response.toJson());
  // } catch (e) {
  //   if (e is XenditException) {
  //     logger.e("XenditException: ${e.errorCode}");
  //     logger.e("XenditException: ${e.message}");
  //     logger.e("XenditException: ${e.errors}");
  //   } else {
  //     logger.e("Exception: ${e.toString()}");
  //   }
  // }

  // try {
  //   final response = await sucrose.xendit.createFVAPayment(
  //     request: XenditFvaPaymentRequest(
  //       currency: XenditQRCurrency.IDR.name,
  //       externalId: "ref-${DateTime.now().millisecondsSinceEpoch}",
  //       bankCode: "MANDIRI",
  //       country: "ID",
  //       isClosed: true,
  //       expectedAmount: 20000,
  //       name: "Admin Gacor",
  //     ),
  //   );

  //   logger.i(response.toJson());
  // } catch (e) {
  //   if (e is XenditException) {
  //     logger.e("XenditException: ${e.errorCode}");
  //     logger.e("XenditException: ${e.message}");
  //     logger.e("XenditException: ${jsonEncode(e.errors)}");
  //   } else {
  //     logger.e("Exception: ${e.toString()}");
  //   }
  // }

  // try {
  //   final response = await sucrose.xendit.getFVAPaymentById(
  //     id: "48c54276-0d79-4ba1-a076-5025720dfe75",
  //   );
  //   logger.i(response.toJson());
  // } catch (e) {
  //   if (e is XenditException) {
  //     logger.e("XenditException: ${e.errorCode}");
  //     logger.e("XenditException: ${e.message}");
  //     logger.e("XenditException: ${jsonEncode(e.errors)}");
  //   } else {
  //     logger.e("Exception: ${e.toString()}");
  //   }
  // }

  try {
    final response = await sucrose.xendit.patchFVAPayment(
      id: "48c54276-0d79-4ba1-a076-5025720dfe75",
      request: XenditPatchFvaPaymentRequest(
        expectedAmount: 1000,
      ),
    );

    logger.i(response.toJson());
  } catch (e) {
    if (e is XenditException) {
      logger.e("XenditException: ${e.errorCode}");
      logger.e("XenditException: ${e.message}");
      logger.e("XenditException: ${jsonEncode(e.errors)}");
    } else {
      logger.e("Exception: ${e.toString()}");
    }
  }

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
