import 'dart:convert';

import 'package:sucrose/src/xendit/models/entity/xendit_customer.dart';
import 'package:sucrose/src/xendit/models/request/invoice/xendit_invoice_request.dart';
import 'package:sucrose/src/xendit/models/request/linking/ewallet/xendit_ewallet_linking_request.dart';
import 'package:sucrose/src/xendit/models/request/linking/ewallet/xendit_update_ewallet_request.dart';
import 'package:sucrose/src/xendit/models/request/refund/xendit_refund_request.dart';
import 'package:sucrose/src/xendit/models/request/request_payment/ewallet/xendit_ewallet_request.dart';
import 'package:sucrose/src/xendit/models/request/request_payment/qr/xendit_qr_request.dart';
import 'package:sucrose/src/xendit/models/request/request_payment/virtual_account/xendit_virtual_account_request.dart';
import 'package:sucrose/src/xendit/models/response/customer/xendit_customer_response.dart';
import 'package:sucrose/src/xendit/models/response/general/ewallet/xendit_ewallet_response.dart';
import 'package:sucrose/src/xendit/models/response/general/xendit_list_payment_method_response.dart';
import 'package:sucrose/src/xendit/models/response/general/xendit_list_payment_request_response.dart';
import 'package:sucrose/src/xendit/models/response/general/xendit_payment_method_by_id_response.dart';
import 'package:sucrose/src/xendit/models/response/general/xendit_payment_request_by_id_response.dart';
import 'package:sucrose/src/xendit/models/response/invoice/xendit_invoice_response.dart';
import 'package:sucrose/src/xendit/models/response/refund/xendit_refund_response.dart';
import 'package:sucrose/src/xendit/models/response/request_payment/xendit_request_payment_response.dart';
import 'package:sucrose/src/xendit/services/endpoint/xendit_endpoint.dart';
import 'package:sucrose/src/xendit/services/exception/xendit_exception.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class XenditHttpRequest {
  final String _tag = "XenditHttpRequest";

  // init singleton

  final Dio _dio = Dio();

  XenditHttpRequest.init(String apiKey, {bool debug = false}) {
    if (debug) {
      _dio.interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ));

      _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            _logger.i("$_tag: ${options.headers}");
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

  final XenditEndpoint _endpoint = XenditEndpoint();

  /// Create a new invoice
  ///
  /// [data] is the request body, see [XenditInvoiceRequest]

  /// The sub-account user-id that you want to make this transaction for.
  /// Split Rule ID that you would like to apply to this Invoice in order to split and route payments to multiple accounts.
  Future<XenditInvoiceResponse> createInvoice({
    required XenditInvoiceRequest data,
    String forUserId = "",
    String withSplitRule = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.createInvoice(),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule
          },
        ),
        data: jsonEncode(data.toJson()),
      );
      return XenditInvoiceResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  /// Get invoice by id
  Future<XenditInvoiceResponse> getInvoice({
    required String invoiceId,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getInvoice(invoiceId),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditInvoiceResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  /// Create a new QR Payment Request
  Future<XenditRequestPaymentResponse> createQrPaymentRequest({
    required XenditQrRequest request,
    String forUserId = "",
    String withSplitRule = "",
    String idempotencyKey = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.paymentRequest(),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
            if (idempotencyKey.isNotEmpty) "idempotency-Key": idempotencyKey,
          },
        ),
        data: jsonEncode(request.toJson()),
      );
      return XenditRequestPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  /// Create a new Virtual Account Payment Request

  Future<XenditRequestPaymentResponse> createVAPaymentRequest({
    required XenditVirtualAccountRequest request,
    String forUserId = "",
    String withSplitRule = "",
    String idempotencyKey = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.paymentRequest(),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
            if (idempotencyKey.isNotEmpty) "idempotency-Key": idempotencyKey,
          },
        ),
        data: jsonEncode(request.toJson()),
      );
      return XenditRequestPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  /// Ewallet One Time Payment
  Future<XenditRequestPaymentResponse> createEwalletOTPPaymentRequest({
    required XenditEwalletRequest request,
    String forUserId = "",
    String withSplitRule = "",
    String idempotencyKey = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.paymentRequest(),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
            if (idempotencyKey.isNotEmpty) "idempotency-Key": idempotencyKey,
          },
        ),
        data: jsonEncode(request.toJson()),
      );
      return XenditRequestPaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  /// ----------- General Payment Request ------------

  /// Get Payment Request by id

  Future<XenditPaymentRequestByIdResponse> getPaymentRequest({
    required String id,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getPaymentRequest(id),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditPaymentRequestByIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  /// Get List of Payment Request
  Future<XenditListPaymentRequestResponse> getListPaymentRequest({
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.paymentRequest(),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditListPaymentRequestResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  Future<XenditPaymentMethodByIdResponse> getMethodPaymentById({
    required String id,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getPaymentMethod(id),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditPaymentMethodByIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  Future<XenditListPaymentMethodResponse> getListMethodPayment(
      {String forUserId = ""}) async {
    try {
      Response response = await _dio.get(
        _endpoint.paymentMethod(),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditListPaymentMethodResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  Future<XenditCustomerResponse> createCustomer({
    required XenditCustomer customer,
    String forUserId = "",
    String idempotencyKey = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.createCustomer(),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (idempotencyKey.isNotEmpty) "idempotency-Key": idempotencyKey,
          },
        ),
        data: jsonEncode(
          customer.toJson(),
        ),
      );

      return XenditCustomerResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  Future<XenditEwalletResponse> initializeLinkingEwallet({
    required XenditEwalletLinkingRequest request,
    String forUserId = "",
    String idempotencyKey = "",
    String withSplitRule = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.paymentMethod(),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
            if (idempotencyKey.isNotEmpty) "idempotency-Key": idempotencyKey,
          },
        ),
        data: jsonEncode(
          request.toJson(),
        ),
      );
      return XenditEwalletResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  Future<XenditEwalletResponse> updateEwalletPaymentMethod({
    required String id,
    required XenditUpdateEwalletRequest data,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.patch(
        _endpoint.patchPaymentMethod(id),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
        data: jsonEncode(
          data.toJson(),
        ),
      );
      return XenditEwalletResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  Future<XenditEwalletResponse> expirePaymentMethod({
    required String id,
    String forUserId = "",
    String idempotencyKey = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.expirePaymentMethod(id),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (idempotencyKey.isNotEmpty) "idempotency-Key": idempotencyKey,
          },
        ),
      );
      return XenditEwalletResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  Future<XenditRefundResponse> createRefund({
    required XenditRefundRequest request,
    String forUserId = "",
    String idempotencyKey = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.refund(),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (idempotencyKey.isNotEmpty) "idempotency-Key": idempotencyKey,
          },
        ),
      );
      return XenditRefundResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }

  /// Get Refund by id
  /// [id] is the refund id
  Future<XenditRefundResponse> getRefund({
    required String id,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getRefund(id),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditRefundResponse.fromJson(response.data);
    } on DioException catch (e) {
      return Future.error(
        XenditException.fromJson(
          e.response!.data,
        ),
      );
    } catch (e) {
      return Future.error(
        XenditException(
          message: e.toString(),
        ),
      );
    }
  }
}
