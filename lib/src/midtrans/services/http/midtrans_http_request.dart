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
}
