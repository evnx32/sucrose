import 'dart:convert';

import 'package:sucrose/src/xendit/models/request/invoice/xendit_invoice_request.dart';
import 'package:sucrose/src/xendit/models/request/request_payment/ewallet/xendit_ewallet_request.dart';
import 'package:sucrose/src/xendit/models/request/request_payment/virtual_account/xendit_virtual_account_request.dart';
import 'package:sucrose/src/xendit/models/response/general/xendit_payment_request_by_id_response.dart';
import 'package:sucrose/src/xendit/models/response/invoice/xendit_invoice_response.dart';
import 'package:sucrose/src/xendit/models/response/request_payment/xendit_request_payment_response.dart';
import 'package:sucrose/src/xendit/services/endpoint/xendit_endpoint.dart';
import 'package:sucrose/src/xendit/services/exception/xendit_exception.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../models/request/request_payment/qr/xendit_qr_request.dart';

class XenditHttpRequest {
  String TAG = "XenditHttpRequest";

  // init singleton

  Dio dio = Dio();

  XenditHttpRequest.init(String apiKey) {
    dio.interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    ));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.i("$TAG: ${options.headers}");
          return handler.next(options);
        },
      ),
    );

    logger.i("$TAG: $apiKey");

    // add headers
    dio.options.headers["Authorization"] = apiKey;
    dio.options.headers["Content-Type"] = "application/json";
  }

  Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  XenditEndpoint endpoint = XenditEndpoint();

  /// Create a new invoice
  ///
  /// [data] is the request body, see [XenditInvoiceRequest]
  Future<XenditInvoiceResponse> createInvoice(XenditInvoiceRequest data) async {
    try {
      Response response = await dio.post(
        endpoint.createInvoice(),
        data: jsonEncode(data.toJson()),
      );
      return XenditInvoiceResponse.fromJson(response.data);
    } on DioException catch (e) {
      logger.e("$TAG: ${e.response!.data}");
      rethrow;
    } catch (e) {
      return Future.error(
        XenditException(
          {
            "message": e.toString(),
          },
        ),
      );
    }
  }

  /// Get invoice by id
  Future<XenditInvoiceResponse> getInvoice(String invoiceId) async {
    try {
      Response response = await dio.get(
        endpoint.getInvoice(invoiceId),
      );
      return XenditInvoiceResponse.fromJson(response.data);
    } on DioException catch (e) {
      logger.e("$TAG: ${e.response!.data}");
      rethrow;
    } catch (e) {
      return Future.error(
        XenditException(
          {
            "message": e.toString(),
          },
        ),
      );
    }
  }

  /// Create a new QR Payment Request
  Future<XenditRequestPaymentResponse> createQrPaymentRequest(
      XenditQrRequest data) async {
    logger.i(jsonEncode(data.toJson()));
    try {
      Response response = await dio.post(
        endpoint.createPaymentRequest(),
        data: jsonEncode(data.toJson()),
      );
      return XenditRequestPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      logger.e("$TAG: ${e.response!.data}");
      rethrow;
    } catch (e) {
      logger.e("$TAG: ${e.toString()}");
      rethrow;
    }
  }

  /// Create a new Virtual Account Payment Request

  Future<XenditRequestPaymentResponse> createVAPaymentRequest(
      XenditVirtualAccountRequest data) async {
    logger.i(jsonEncode(data.toJson()));
    try {
      Response response = await dio.post(
        endpoint.createPaymentRequest(),
        data: jsonEncode(data.toJson()),
      );
      return XenditRequestPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      logger.e("$TAG: ${e.response!.data}");
      rethrow;
    } catch (e) {
      logger.e("$TAG: ${e.toString()}");
      rethrow;
    }
  }

  Future<XenditRequestPaymentResponse> createEwalletOTPPaymentRequest(
      XenditEwalletRequest data) async {
    logger.i(jsonEncode(data.toJson()));
    try {
      Response response = await dio.post(
        endpoint.createPaymentRequest(),
        data: jsonEncode(data.toJson()),
      );
      return XenditRequestPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      logger.e("$TAG: ${e.response!.data}");
      rethrow;
    } catch (e) {
      logger.e("$TAG: ${e.toString()}");
      rethrow;
    }
  }

  /// ----------- General Payment Request ------------

  /// Get Payment Request by id

  Future<XenditPaymentRequestByIdResponse> getPaymentRequest(String id) async {
    try {
      Response response = await dio.get(
        endpoint.getPaymentRequest(id),
      );
      return XenditPaymentRequestByIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      logger.e("$TAG: ${e.response!.data}");
      rethrow;
    } catch (e) {
      return Future.error(
        XenditException(
          {
            "message": e.toString(),
          },
        ),
      );
    }
  }
}
