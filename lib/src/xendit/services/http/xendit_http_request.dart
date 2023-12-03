import 'dart:convert';

import 'package:sucrose/src/xendit/models/entity/xendit_customer.dart';
import 'package:sucrose/src/xendit/models/request/invoice/xendit_invoice_request.dart';
import 'package:sucrose/src/xendit/models/request/request_payment/ewallet/xendit_ewallet_request.dart';
import 'package:sucrose/src/xendit/models/request/request_payment/virtual_account/xendit_virtual_account_request.dart';
import 'package:sucrose/src/xendit/models/response/customer/xendit_customer_response.dart';
import 'package:sucrose/src/xendit/models/response/general/xendit_list_payment_method_response.dart';
import 'package:sucrose/src/xendit/models/response/general/xendit_list_payment_request_response.dart';
import 'package:sucrose/src/xendit/models/response/general/xendit_payment_method_by_id_response.dart';
import 'package:sucrose/src/xendit/models/response/general/xendit_payment_request_by_id_response.dart';
import 'package:sucrose/src/xendit/models/response/invoice/xendit_invoice_response.dart';
import 'package:sucrose/src/xendit/models/response/request_payment/xendit_request_payment_response.dart';
import 'package:sucrose/src/xendit/services/endpoint/xendit_endpoint.dart';
import 'package:sucrose/src/xendit/services/exception/xendit_exception.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../models/request/request_payment/qr/xendit_qr_request.dart';

class XenditHttpRequest {
  String tag = "XenditHttpRequest";

  // init singleton

  Dio dio = Dio();

  XenditHttpRequest.init(String apiKey, {bool debug = false}) {
    if (debug) {
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
            logger.i("$tag: ${options.headers}");
            return handler.next(options);
          },
        ),
      );
    }

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
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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
        endpoint.paymentRequest(),
        data: jsonEncode(data.toJson()),
      );
      return XenditRequestPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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

  /// Create a new Virtual Account Payment Request

  Future<XenditRequestPaymentResponse> createVAPaymentRequest(
      XenditVirtualAccountRequest data) async {
    logger.i(jsonEncode(data.toJson()));
    try {
      Response response = await dio.post(
        endpoint.paymentRequest(),
        data: jsonEncode(data.toJson()),
      );
      return XenditRequestPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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

  /// Ewallet One Time Payment
  Future<XenditRequestPaymentResponse> createEwalletOTPPaymentRequest(
      XenditEwalletRequest data) async {
    logger.i(jsonEncode(data.toJson()));
    try {
      Response response = await dio.post(
        endpoint.paymentRequest(),
        data: jsonEncode(data.toJson()),
      );
      return XenditRequestPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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

  /// ----------- General Payment Request ------------

  /// Get Payment Request by id

  Future<XenditPaymentRequestByIdResponse> getPaymentRequest(String id) async {
    try {
      Response response = await dio.get(
        endpoint.getPaymentRequest(id),
      );
      return XenditPaymentRequestByIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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

  /// Get List of Payment Request
  Future<XenditListPaymentRequestResponse> getListPaymentRequest() async {
    try {
      Response response = await dio.get(
        endpoint.paymentRequest(),
      );
      return XenditListPaymentRequestResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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

  Future<XenditPaymentMethodByIdResponse> getMethodPaymentById(
      String id) async {
    try {
      Response response = await dio.get(
        endpoint.getPaymentMethod(id),
      );
      return XenditPaymentMethodByIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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

  Future<XenditListPaymentMethodResponse> getListMethodPayment() async {
    try {
      Response response = await dio.get(endpoint.getListPaymentMethod());
      return XenditListPaymentMethodResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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

  Future<XenditCustomerResponse> createCustomer(XenditCustomer customer) async {
    try {
      Response response = await dio.post(
        endpoint.createCustomer(),
        data: jsonEncode(
          customer.toJson(),
        ),
      );
      return XenditCustomerResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            type: e.type,
            error: {
              "message": e.response!.data,
            }),
      );
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
