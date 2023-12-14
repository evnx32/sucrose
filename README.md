
# Sucrose

A **Bridge Payment Gateway** for Xendit and any other payment gateway.

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

## Get Started with Midtrans

#### Create Snap Transaction
```dart
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
```


## Feedback

If you have any feedback, please reach out to us at evnx32@gmail.com
