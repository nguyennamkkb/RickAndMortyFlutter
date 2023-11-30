import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio = Dio();

  // Constructor
  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Content-Type'] = 'application/json; charset=utf-8';
          options.connectTimeout = const Duration(minutes: 5); // 5 seconds
          options.receiveTimeout = const Duration(minutes: 5); // 5 seco
          return handler.next(options);
        },
      ),
    );
  }
  Future<void> updateJwtToken(String newToken) async {
    try {
      if (newToken != "") {
        _dio.options.headers['Authorization'] = 'Bearer $newToken';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating JWT: $e');
      }
    }
  }

  // GET request
  Future<Response> get(String endpoint) async {
    try {
      print("get $endpoint");
      return await _dio.get(endpoint);
    } catch (error) {
      print("error $error");
      throw _handleError(error);
    }
  }

  // POST request
  Future<Response> post(String endpoint, dynamic data) async {
    try {
      return await _dio.post(endpoint, data: jsonEncode(data));
    } catch (error) {
      throw _handleError(error);
    }
  }

  // PUT request
  Future<Response> put(String endpoint, dynamic data) async {
    try {
      return await _dio.put(endpoint, data: jsonEncode(data));
    } catch (error) {
      throw _handleError(error);
    }
  }

  // DELETE request
  Future<Response> delete(String endpoint) async {
    try {
      return await _dio.delete(endpoint);
    } catch (error) {
      throw _handleError(error);
    }
  }

  // Xử lý lỗi
  dynamic _handleError(error) {
    if (error is DioError) {
      String message = 'Đã xảy ra lỗi không xác định';
      if (error.response != null && error.response?.data != null) {
        // Hiển thị thông báo lỗi từ server nếu có
        message = error.response?.data['message'] ?? message;
      }
      throw message;
    } else {
      throw 'Đã xảy ra lỗi không xác định';
    }
  }
}
