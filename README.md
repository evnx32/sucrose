
# Sucrose

A **Bridge Payment Gateway** for Xendit and any other payment gateway, but for now only **Xendit** available. Soon we'll add another payment gateway.




## Installation

```bash
flutter pub add sucrose
```
    
## Getting Started

#### Init Xendit
```
import 'package:sucrose/sucrose.dart';
    
final sucrose = Sucrose.initXendit(xenditApiKey:"YOUR_API_KEY");
```


#### Create QR Payment Request

```
  final response = await sucrose.xendit.createQrPaymentRequest(

    // Here you can input some value.
    XenditQrRequest(
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
```

  final response = await sucrose.xendit.createInvoice(
    XenditInvoiceRequest(
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
