import 'dart:convert';

import 'package:sucrose/src/xendit/models/xendit_models.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sucrose/src/xendit/services/endpoint/xendit_endpoint.dart';
import 'package:sucrose/src/xendit/services/exception/xendit_exception.dart';

class XenditHttpRequest {
  /// XenditHttpRequest tag for logging
  final String _tag = "XenditHttpRequest";

  final Dio _dio = Dio();

  /// Initialize XenditHttpRequest
  ///
  /// `apiKey` is your Xendit API Key
  ///
  /// `debug` is to enable debug mode, default is false
  XenditHttpRequest.init(String apiKey, {bool debug = false}) {
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

  final XenditEndpoint _endpoint = XenditEndpoint();

  /// Create a new invoice
  ///
  /// `request` is the request body, see `XenditInvoiceRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  Future<XenditInvoiceResponse> createInvoice({
    required XenditInvoiceRequest request,
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
        data: jsonEncode(request.toJson()),
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
  ///
  /// `invoiceId` is the invoice id that you want to get
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information

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
  ///
  /// `request` is the request body, see `XenditQrRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
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
            if (idempotencyKey.isNotEmpty) "idempotency-key": idempotencyKey,
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
  ///
  /// `request` is the request body, see `XenditVirtualAccountRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
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
  ///
  /// `request` is the request body, see `XenditEwalletRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
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
  ///
  /// `id` is the payment request id that you want to get
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
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
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
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

  /// Get List of Payment Request by id
  ///
  /// `id` is the payment request id that you want to get
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  Future<XenditPaymentMethodByIdResponse> getPaymentMethodById({
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

  /// Get List of Payment Method
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
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

  /// Create new Customer
  ///
  /// `customer` is the request body, see `XenditCustomer`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
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

  /// Initialize Linking Ewallet
  ///
  /// `request` is the request body, see `XenditEwalletLinkingRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
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

  /// UpdateEwalletPaymentMethod
  ///
  /// `id` is the payment method id that you want to update
  ///
  /// `request` is the request body, see `XenditUpdateEwalletRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  Future<XenditEwalletResponse> updateEwalletPaymentMethod({
    required String id,
    required XenditUpdateEwalletRequest request,
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

  /// Expire Payment Method
  ///
  /// `id` is the payment method id that you want to expire
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
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

  /// Create Refund
  ///
  /// `request` is the request body, see `XenditRefundRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
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
  ///
  /// `id` is the refund id
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information

  Future<XenditRefundResponse> getRefundById({
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

  /// Subsequent Payment with Active Payment Method
  ///
  /// `request` is the request body, see `XenditSubSequentPaymentRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
  Future<XenditRequestPaymentResponse> subSequentWithActivePayment({
    required XenditSubSequentPaymentRequest request,
    String forUserId = "",
    String idempotencyKey = "",
    String withSplitRule = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.paymentRequest(),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (idempotencyKey.isNotEmpty) "idempotency-Key": idempotencyKey,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
          },
        ),
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

  /// Initialize Linking and Pay
  ///
  /// `request` is the request body, see `XenditInitializeAndPayRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
  Future<XenditRequestPaymentResponse> initializeLinkingAndPay({
    required XenditInitializeAndPayRequest request,
    String forUserId = "",
    String idempotencyKey = "",
    String withSplitRule = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.paymentRequest(),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (idempotencyKey.isNotEmpty) "idempotency-Key": idempotencyKey,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
          },
        ),
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

  /// Create Report
  ///
  /// `request` is the request body, see `XenditReportRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  Future<XenditReportResponse> createReport({
    required XenditReportRequest request,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.createReport(),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditReportResponse.fromJson(response.data);
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

  /// Get Report by id
  ///
  /// `id` is the report id that you want to get
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information

  Future<XenditReportResponse> getReportById({
    required String id,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getReport(id),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditReportResponse.fromJson(response.data);
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

  /// Create QR Codes Payment
  ///
  /// `request` is the request body, see `XenditQrCodesRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  ///
  /// `idempotencyKey` Provided to prevent duplicate requests. Can be equal to any UUID. Idempotency keys are stored on the request layer; it expires after 24 hours from the first request. Note: Max 100 characters
  ///
  /// `apiVersion` The API version that will be used to process the request.
  ///
  /// `2022-07-31` Latest	v2 QR Codes API to support customized expiry time of a dynamic QR code
  ///
  /// `2020-07-01` Previous version	v1 QR Codes API without customized expiry time of a dynamic QR code
  ///
  /// `webhookUrl` Callback URL where payment notifications will be sent. Default is the callback URL in your Dashboard for `QR code paid`
  Future<XenditQrCodesResponse> createQrCodesPayment({
    required XenditQrCodesRequest request,
    String forUserId = "",
    String idempotencyKey = "",
    String withSplitRule = "",
    String apiVersion = "2022-07-31",
    String webhookUrl = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.createQRCodePayment(),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            // "api-version": "2022-07-31",
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (idempotencyKey.isNotEmpty) "idempotency-key": idempotencyKey,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
            if (apiVersion.isNotEmpty) "api-version": apiVersion,
            if (webhookUrl.isNotEmpty) "webhook-url": webhookUrl,
          },
        ),
      );
      return XenditQrCodesResponse.fromJson(response.data);
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

  /// Get QR Codes Payment by id
  ///
  /// QR codes payment instrument allows you to receive payments directly from end user's mobile banking app balance or eWallet balance. In Indonesia, our merchants can receive payments from any providers connected on QRIS network (e.g. OVO, GoPay, DANA, LinkAja, BCA, and ShopeePay). See full list [here](https://www.aspi-indonesia.or.id/standar-dan-layanan/qris/).
  ///
  /// `id` is the QR code id that you want to get
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `apiVersion` The API version that will be used to process the request.
  ///
  /// `2022-07-31` Latest	v2 QR Codes API to support customized expiry time of a dynamic QR code
  ///
  /// `2020-07-01` Previous version	v1 QR Codes API without customized expiry time of a dynamic QR code
  Future<XenditQrCodesResponse> getQrCodesPaymentById({
    required String id,
    String forUserId = "",
    String apiVersion = "2022-07-31",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getQRCodePaymentByID(id),
        options: Options(
          headers: {
            "api-version": "2022-07-31",
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (apiVersion.isNotEmpty) "api-version": apiVersion,
          },
        ),
      );
      return XenditQrCodesResponse.fromJson(response.data);
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

  /// Refund QR Codes Payment
  ///
  /// `id` is the payment id, starts with `qrpy_`
  ///
  /// `request` is the request body, see
  Future<XenditPaymentRefundResponse> refundQrCodesPayment({
    required String id,
    required XenditPaymentRefundRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.refundQRCodePayment(id),
        data: jsonEncode(
          request.toJson(),
        ),
      );
      return XenditPaymentRefundResponse.fromJson(response.data);
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

  /// Create Virtual Account Payment
  ///
  /// Virtual Accounts are virtual bank accounts that can be created and assigned to your customers and act as medium to receive payments where your customers will pay via Bank Transfer.
  ///
  /// `request` is the request body, see `XenditFvaPaymentRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  Future<XenditFvaPaymentResponse> createFVAPayment({
    required XenditFvaPaymentRequest request,
    String forUserId = "",
    String withSplitRule = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.createFixedVirtualAccount(),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
          },
        ),
      );
      return XenditFvaPaymentResponse.fromJson(response.data);
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

  /// Create Virtual Account Payment
  ///
  /// `request` is the request body, see `XenditFvaPaymentRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  Future<XenditFvaPaymentResponse> getFVAPaymentById({
    required String id,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getFixedVirtualAccount(id),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditFvaPaymentResponse.fromJson(response.data);
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

  /// Patch Virtual Account Payment
  ///
  /// Update Virtual Account API allows you to update Virtual Account type and information according to your business need. You can update VA when the VA status is `ACTIVE`. API will throw error when you update `INACTIVE` VA.
  ///
  /// `request` is the request body, see `XenditPatchFvaPaymentRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  Future<XenditFvaPaymentResponse> patchFVAPayment(
      {required String id,
      required XenditPatchFvaPaymentRequest request,
      String forUserId = ""}) async {
    try {
      Response response = await _dio.patch(
        _endpoint.patchFixedVirtualAccount(id),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditFvaPaymentResponse.fromJson(response.data);
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

  /// Create ewallet payment
  ///
  /// `request` is the request body, see
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  Future<XenditEwalletPaymentResponse> createEwalletPayment({
    required XenditEwalletPaymentRequest request,
    String forUserId = "",
    String withSplitRule = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.createEwalletPayment(),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
          },
        ),
      );
      return XenditEwalletPaymentResponse.fromJson(response.data);
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

  /// Get ewallet payment by id
  ///
  /// `request` is the request body
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  Future<XenditEwalletPaymentResponse> getEwalletPaymentById({
    required String id,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getEwalletPayment(id),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditEwalletPaymentResponse.fromJson(response.data);
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

  /// Refund ewallet payment
  ///
  /// `id` is the payment id, starts with `ewc_`
  ///
  /// `request` is the request body, see
  Future<XenditPaymentRefundResponse> refundEwalletPayment({
    required String id,
    required XenditPaymentRefundRequest request,
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.refundEwalletPayment(id),
        data: jsonEncode(
          request.toJson(),
        ),
      );
      return XenditPaymentRefundResponse.fromJson(response.data);
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

  /// Create Fixed OTC Payment
  ///
  /// One way for your customer to pay through Retail Outlets is by providing them Fixed Payment Code. Fixed payment code is a dedicated payment code under a name you choose, e.g. 'YourCompany - Becca Salim'. You will receive a webhook each time this fixed payment code is paid.
  ///
  /// `request` is the request body, see `XenditFixedOtcRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  ///
  /// `withSplitRule` Split Rule ID that you would like to apply to this Payment Request in order to split and route payments to multiple accounts.
  ///
  /// Please note: If you include this parameter, we will return the split_rule_id in the header of the API response.
  ///
  /// If for-user-id header is not present, Split Rule will still be routed from platform account to the specified destination account
  ///
  /// Please note that this is the newest header version, the older version with-fee-rule header will be deprecated by September 30, 2025. Please migrate to this version before the the deprecation date if you are still using with-fee-rule header.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information.
  Future<XenditFixedOtcResponse> createFixedOTCPayment({
    required XenditFixedOtcRequest request,
    String forUserId = "",
    String withSplitRule = "",
  }) async {
    try {
      Response response = await _dio.post(
        _endpoint.createFixedVirtualAccount(),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
            if (withSplitRule.isNotEmpty) "with-split-rule": withSplitRule,
          },
        ),
      );
      return XenditFixedOtcResponse.fromJson(response.data);
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

  /// Create Fixed OTC Payment
  ///
  /// One way for your customer to pay through Retail Outlets is by providing them Fixed Payment Code. Fixed payment code is a dedicated payment code under a name you choose, e.g. 'YourCompany - Becca Salim'. You will receive a webhook each time this fixed payment code is paid.
  ///
  /// `id` is the payment id
  ///
  /// `request` is the request body, see `XenditFixedOtcRequest`
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  Future<XenditFixedOtcResponse> patchFixedOTCPayment({
    required String id,
    required XenditPatchFixedOtcRequest request,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.patch(
        _endpoint.patchFixedPaymentCode(id),
        data: jsonEncode(
          request.toJson(),
        ),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditFixedOtcResponse.fromJson(response.data);
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

  /// Get Fixed OTC Payment by id
  ///
  /// `request` is the request body
  ///
  /// `forUserId` is the sub-account user-id that you want to make this transaction for.
  ///
  /// The sub-account user-id that you want to make this transaction for.
  ///
  /// This header is only used if you have access to xenPlatform. See [xenPlatform](https://developers.xendit.co/api-reference/payments-api/#xenplatform) for more information
  Future<XenditFixedOtcResponse> getFixedOTCPaymentById({
    required String id,
    String forUserId = "",
  }) async {
    try {
      Response response = await _dio.get(
        _endpoint.getFixedPaymentCode(id),
        options: Options(
          headers: {
            if (forUserId.isNotEmpty) "for-user-id": forUserId,
          },
        ),
      );
      return XenditFixedOtcResponse.fromJson(response.data);
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
