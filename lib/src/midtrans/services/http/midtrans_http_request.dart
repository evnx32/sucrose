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
    _environment = environment;
    if (environment == MidtransEnvironment.PRODUCTION) {
      _dio.options.baseUrl = "https://app.midtrans.com";
    } else {
      _dio.options.baseUrl = "https://api.sandbox.midtrans.com";
    }

    if (debug) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          responseBody: true,
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
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

    // add headers
    _dio.options.headers["Authorization"] = apiKey;
    _dio.options.headers["Content-Type"] = "application/json";
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
}
