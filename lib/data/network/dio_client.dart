import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' as getx;
import 'package:mechtronz/global/controller/init_controller.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.interceptors.clear();

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add the access token to the request header
          final token = getx.Get.find<InitController>().token;
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          errorHandling(e.response);
          return handler.next(e);
        },
      ),
    );
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response response = await _dio.get(
        uri.trim(),
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response response = await _dio
          .post(
            uri.trim(),
            data: data,
            queryParameters: queryParameters,
          )
          .timeout(const Duration(minutes: 1));

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on TimeoutException catch (_) {
      throw TimeoutException('Timeout');
    } catch (e) {
      rethrow;
    }
  }

  //Delete:- ................................................................

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri.trim(),
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }

  //Put:- ................................................................

  Future<dynamic> update(String uri,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final Response response = await _dio.put(
        uri.trim(),
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } on TimeoutException catch (_) {
      throw TimeoutException('Timeout');
    } catch (e) {
      rethrow;
    }
  }

  //Patch:- ................................................................

  Future<dynamic> patch(String uri,
      {data, Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final Response response = await _dio.patch(
        uri.trim(),
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (e) {
      throw FormatException(e.toString());
    } on TimeoutException catch (e) {
      throw TimeoutException(e.toString());
    } catch (e) {
      rethrow;
    }
  }

  void errorHandling(Response? response) {
    // var resMsg = response?.data['message'];
    debugPrint("res=$response");
  }
}
