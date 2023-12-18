import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sucrose/src/midtrans/enums/enums.dart';
import 'package:sucrose/src/midtrans/models/midtrans_models.dart';
import 'package:sucrose/src/midtrans/services/endpoint/midtrans_endpoint.dart';
import 'package:sucrose/src/midtrans/services/exception/midtrans_exception.dart';

class MidtransHttpRequest {
  /// MidtransHttpRequest tag for logging
  final String _tag = "MidtransHttpRequest";

  final Dio _dio = Dio();

  MidtransEnvironment _environment = MidtransEnvironment.SANDBOX;

  /// Initialize MidtransHttpRequest
  ///
  /// `apiKey` is your Xendit API Key
  ///
  /// `environment` is your Xendit Environment, default is MidtransEnvironment.SANDBOX
  ///
  /// `debug` is to enable debug mode, default is false

  MidtransHttpRequest.init({
    required String apiKey,
    required MidtransEnvironment environment,
    bool debug = false,
  }) {
    _dio.options = BaseOptions(
      baseUrl: environment == MidtransEnvironment.PRODUCTION
          ? "https://app.midtrans.com"
          : "https://api.sandbox.midtrans.com",
      headers: {
        "Authorization": apiKey,
        "Accept": "*/*",
        "Content-Type": "application/json"
      },
    );

    _environment = environment;

    if (debug) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
        ),
      );

      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            _logger.d("$_tag: ${options.headers}");
            return handler.next(options);
          },
        ),
      );
    }
  }

  final Logger _logger = Logger(
    printer: PrettyPrinter(),
  );

  final MidtransEndpoint _endpoint = MidtransEndpoint();

  /// --------------- CORE API ---------------
  ///
  /// Core API is a set of APIs that can be used to build your own payment UI flow.

  /// Get Card Token
  ///
  /// Token ID is a unique value that is associated with the customer’s credit card information during a transaction. The GET Token method sends the credit card information via Midtrans.min.js to Midtrans server and returns the Token ID to you.
  ///
  /// `clientKey` is your Midtrans Client Key
  ///
  /// `cardNumber` The 16 digits Credit Card number.
  ///
  /// `cardExpMonth` The card expiry month in MM format.
  ///
  /// `cardExpYear` The card expiry year in YYYY format.
  ///
  /// `cardCvv` The CVV number printed on the card.
  ///
  ///
  Future<MidtransCardTokenResponse> getCardToken({
    required String clientKey,
    required String cardNumber,
    required String cardExpMonth,
    required String cardExpYear,
    required String cardCvv,
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.cardToken(
          clientKey,
          cardNumber,
          cardExpMonth,
          cardExpYear,
          cardCvv,
        ),
        options: Options(
          headers: {},
        ),
      );
      return MidtransCardTokenResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Register Card
  ///
  /// Register Card can be triggered to register the card information of the customer for future one click and two click transactions.
  ///
  /// `clientKey` is your Midtrans Client Key
  ///
  /// `cardNumber` The 16 digits Credit Card number.
  ///
  /// `cardExpMonth` The card expiry month in MM format.
  ///
  /// `cardExpYear` The card expiry year in YYYY format.
  ///
  /// `cardCvv` The CVV number printed on the card.
  Future<MidtransRegisterCardResponse> registerCard({
    required String clientKey,
    required String cardNumber,
    required String cardExpMonth,
    required String cardExpYear,
    required String cardCvv,
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.registerCard(
          clientKey,
          cardNumber,
          cardExpMonth,
          cardExpYear,
          cardCvv,
        ),
        options: Options(
          headers: {},
        ),
      );
      return MidtransRegisterCardResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create Credit Card Charge
  Future<MidtransCreditCardResponse> chargeCreditCard({
    required MidtransCreditCardRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransCreditCardResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create Permata VA Charge
  Future<MidtransPermataVaResponse> chargePermataVA({
    required MidtransPermataVARequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransPermataVaResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create BNI Virtual Account Charge
  Future<MidtransBniVAResponse> chargeBniVA({
    required MidtransBniVARequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransBniVAResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create BCA Virtual Account Charge
  Future<MidtransBcaVAResponse> chargeBcaVA({
    required MidtransBcaVARequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransBcaVAResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create BRI Virtual Account Charge
  Future<MidtransBriVAResponse> chargeBriVA({
    required MidtransBriVARequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransBriVAResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create BCA Virtual Account Charge
  Future<MidtransCimbVAResponse> chargeCimbVA({
    required MidtransCimbVARequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransCimbVAResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create Gopay Virtual Account Charge
  Future<MidtransGopayResponse> chargeGopay({
    required MidtransGopayRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransGopayResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create Gopay Virtual Account Charge
  Future<MidtransQrisResponse> chargeQRIS({
    required MidtransQrisRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransQrisResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create Gopay Virtual Account Charge
  Future<MidtransShopeePayResponse> chargeShopeePay({
    required MidtransShopeePayRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransShopeePayResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Create Gopay Virtual Account Charge
  Future<MidtransOtcResponse> chargeOverTheCounter({
    required MidtransOTCRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransOtcResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Cancel Transaction
  ///
  /// `id` is your Midtrans `transaction_id`, or you can use `order_id` instead
  Future<MidtransCancelResponse> cancelTransaction({
    required String id,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.cancelTransaction(id),
        options: Options(
          headers: {},
        ),
      );
      return MidtransCancelResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Expire Transaction
  ///
  /// `id` is your Midtrans `transaction_id`, or you can use `order_id` instead
  Future<MidtransExpiredResponse> expireTransaction({
    required String id,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.expireTransaction(id),
        options: Options(
          headers: {},
        ),
      );
      return MidtransExpiredResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Refund Transaction
  ///
  /// `id` is your Midtrans `transaction_id`, or you can use `order_id` instead
  ///
  /// `request` MidtransRefundRequest can be used to set the amount to be refunded and the reason for the refund.
  Future<MidtransExpiredResponse> refundTransaction({
    required String id,
    MidtransRefundRequest? request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.refundTransaction(id),
        data: jsonEncode(request?.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransExpiredResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Get Status Transaction
  ///
  /// `id` is your Midtrans `transaction_id`, or you can use `order_id` instead.
  Future<MidtransStatusTransactionResponse> getStatusTransaction({
    required String id,
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.transactionStatus(id),
        options: Options(
          headers: {},
        ),
      );
      return MidtransStatusTransactionResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Get Status Transaction
  ///
  /// `id` is your Midtrans `transaction_id`, or you can use `order_id` instead.
  Future<MidtransSnapTransactionResponse> createSnapTransaction({
    required MidtransSnapTransactionRequest request,
  }) async {
    try {
      if (_environment == MidtransEnvironment.PRODUCTION) {
        _dio.options.baseUrl = "https://app.midtrans.com";
      } else {
        _dio.options.baseUrl = "https://app.sandbox.midtrans.com/";
      }
      Response response = await _dio.post(
        _endpoint.snapTransaction(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransSnapTransactionResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Gopay Account Tokenization
  ///
  /// `request` is for the details of the customer’s GoPay account. See `MidtransGoPayAccountRequest` for more details.
  Future<MidtransGoPayAccountResponse> createGopayAccountLinked({
    required MidtransGopayAccountRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.payAccount(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {},
        ),
      );
      return MidtransGoPayAccountResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Get Gopay Subscription
  ///
  /// Get Pay Account is triggered to get GoPay's account linked status. This method is only applicable for GoPay Tokenizations.
  ///
  /// `id` is your GoPay's account linked status. `account_id`,
  Future<MidtransGetGoPayAccountResponse> getGopayAccountLinked({
    required String id,
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getPayAccount(id),
        options: Options(
          headers: {},
        ),
      );
      return MidtransGetGoPayAccountResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Unbind GoPay Account
  ///
  /// `accountID` is your GoPay's account linked status. `account_id`,
  Future<MidtransUnbindGoPayAccountResponse> unbindGopayAccountLinked({
    required String accountID,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.unbindPayAccount(accountID),
        options: Options(
          headers: {},
        ),
      );
      return MidtransUnbindGoPayAccountResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Gopay Account Tokenization
  ///
  /// `request` is for the details of the customer’s GoPay account. See `MidtransGoPayAccountRequest` for more details.
  Future<MidtransSubscriptionGopayResponse> createGopaySubscription({
    required MidtransSubscriptionGopayRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.subscription(),
        data: jsonEncode(request.toJson()),
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": _dio.options.headers["Authorization"],
          },
        ),
      );
      return MidtransSubscriptionGopayResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Get Gopay Subscription
  ///
  /// Get Pay Account is triggered to get GoPay's account linked status. This method is only applicable for GoPay Tokenizations.
  ///
  /// `id` is your GoPay's account linked status. `account_id`,
  Future<MidtransGetSubscriptionGopayResponse> getSubscriptionGopay({
    required String id,
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getSubscription(id),
      );
      return MidtransGetSubscriptionGopayResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Disable Gopay Subscription
  ///
  /// Disable a customer's subscription account with a specific `subscription_id` so that the customer is not charged for the subscription in the future. Successful request returns `status_message` indicating that the subscription details are updated.
  ///
  /// `id` is your GoPay Subscription ID
  Future<MidtransStatusMessageResponse> disableSubscriptionGopay({
    required String id,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.disableSubscription(id),
      );
      return MidtransStatusMessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Enable Gopay Subscription
  ///
  /// Activate a customer's subscription account with a specific `subscription_id` so that the customer is charged for the subscription in the future. Successful request returns `status_message` indicating that the subscription details are updated.
  ///
  /// `id` is your GoPay Subscription ID
  Future<MidtransStatusMessageResponse> enableSubscriptionGopay({
    required String id,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.enableSubscription(id),
      );
      return MidtransStatusMessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Enable Gopay Subscription
  ///
  /// Activate a customer's subscription account with a specific `subscription_id` so that the customer is charged for the subscription in the future. Successful request returns `status_message` indicating that the subscription details are updated.
  ///
  /// `id` is your GoPay Subscription ID
  Future<MidtransStatusMessageResponse> patchSubscriptionGopay({
    required String id,
    required MidtransPatchSubscriptionGopayRequest request,
  }) async {
    try {
      Response response = await _dio.patch(
        _endpoint.updateSubscription(id),
        data: jsonEncode(request.toJson()),
      );
      return MidtransStatusMessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// AkuLaku Charge
  ///
  /// In addition to their shopping mall business, Akulaku has been enabling E-commerce to sell their merchandise in installment. It allows their customers to pay in installment without a payment card as long as they are registered to Akulaku.
  ///
  /// `request` is for the details of the customer’s Akulaku account. See `MidtransAkulakuRequest` for more details.
  Future<MidtransAkulakuResponse> chargeAkulaku({
    required MidtransAkulakuRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
      );
      return MidtransAkulakuResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }

  /// Charge Kredivo
  ///
  /// Kredivo has been enabling E-commerce to sell their merchandise in installment. It allows their customers to pay in installment without a payment card as long as they are registered to Kredivo.
  ///
  /// `request` is for the details of the customer’s Kredivo account. See `MidtransKredivoRequest` for more details.
  Future<MidtransKredivoResponse> chargeKredivo({
    required MidtransKredivoRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.charge(),
        data: jsonEncode(request.toJson()),
      );
      return MidtransKredivoResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        MidtransException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        MidtransException(
          statusMessage: e.toString(),
        ),
      );
    }
  }
}
