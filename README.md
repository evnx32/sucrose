
# Sucrose

A **Bridge Payment Gateway** for Xendit and any other payment gateway, but for now only **Xendit** available. Soon we'll add another payment gateway.

<p align="center">
    <img alt="GitHub" src="https://img.shields.io/github/license/evnx32/sucrose?style=flat"></a>
    <img src="https://img.shields.io/github/repo-size/evnx32/sucrose" alt="Repo Size" /></a>
    <img alt="Pub Version" src="https://img.shields.io/pub/v/sucrose">
    <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/evnx32/sucrose">
    <img alt="Codacy grade" src="https://img.shields.io/codacy/grade/50dbfa9009ce4cac8f76064077704738">
</p>



## Available Payment Gateway
- [x]   Xendit (WIP)
- [x]   Midtrans (WIP)

## Installation

```bash
flutter pub add sucrose
```
    
## Getting Started

#### Init Xendit
```dart
import 'package:sucrose/sucrose.dart';
    
final sucrose = Sucrose.initXendit(xenditApiKey:"YOUR_API_KEY");
```

#### Init Midtrans
```dart
import 'package:sucrose/sucrose.dart';
    
final sucrose = Sucrose.initMidtrans(
    midtransApiKey: "YOUR_API_KEY",
    environment: MidtransEnvironment.SANDBOX,
    debug: true,
);

```


## Get Started with Xendit

#### Create QR Payment Request

```dart
  final response = await sucrose.xendit.createQrPaymentRequest(

    // Here you can input some value.
    request: XenditQrRequest(
      amount: 10000,
      currency: XenditQRCurrency.IDR,
      paymentMethod: XenditQRPaymentMethod(
        reusability: XenditReusablePaymentMethod.ONE_TIME_USE,
        qrCode: XenditQrCodeProps(
          channelCode: XenditQRChannelCode.DANA,
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
```


#### Create Invoice
```dart
  final response = await sucrose.xendit.createInvoice(
    request: XenditInvoiceRequest(
      externalId: "ref 13123213",
      amount: 10000,
      description: "your description goes here",
      payerEmail: "hello@mail.com",
      items: [
        XenditInvoiceItem(
          name: "item 1",
          price: 10000,
          quantity: 1,
          category: "meow",
          url: "https://google.com",
        ),
      ],
    ),
  );
```
## Feedback

If you have any feedback, please reach out to us at evnx32@gmail.com
