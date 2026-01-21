import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shop_app/core/error/exceptions.dart';
import 'package:shop_app/core/utils/api_constant.dart';
import 'package:shop_app/data/interceptor/network_interceptor.dart';
import 'package:shop_app/data/interceptor/retry_interceptor.dart';
import 'package:shop_app/data/interceptor/token_interceptor.dart';
import 'package:shop_app/data/repository/api_repository.dart';

@Injectable(as: ApiRepository)
class ApiRepositoryImpl implements ApiRepository {
  final Dio dio;
  final Connectivity connectivity;
  final String baseURL;

  ApiRepositoryImpl(this.connectivity)
    : dio = Dio(),
      baseURL = ApiConstant.appbaseUrl {
    dio.interceptors.add(
      NetworkInterceptor(
        retryInterceptor: RetryInterceptor(
          dio: dio,
          connectivity: connectivity,
        ),
        tokenInterCeptor: TokenInterceptor(dio: dio),
      ),
    );
    if (kDebugMode) {
      print('Base URL: $baseURL');
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true, error: true),
      );
    }
  }

  @override
  Future<dynamic> delete(String methodName, String token) async {
    try {
      final response = await dio.delete(
        "$baseURL$methodName",
        options: Options(
          headers: {
            'Content-Type': 'application/json;charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> deleteWithPayload(String methodName, data) async {
    try {
      final response = await dio.delete("$baseURL$methodName", data: data);
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> fromPost(String methodname, File data) async {
    try {
      final fileName = data.path.split('/').last;
      if (kDebugMode) {
        print('File Name: $fileName');
      }
      final headers = {'Content-Type': 'multipart/form-data;charset=UTF-8'};
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(data.path, filename: fileName),
      });
      final dio = Dio();
      final response = await dio.post(
        "$baseURL$methodname",
        data: formData,
        options: Options(method: 'POST', headers: headers),
      );
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> get(String methodName, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.get(
        "$baseURL$methodName",
        queryParameters: data,
      );
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> getAll(String methodName) async {
    try {
      final response = await dio.get(
        "$baseURL$methodName",
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> getPlaces(
    String input,
    bool isMapBox, {
    Map<String, dynamic>? data,
  }) async {
    try {
      Response response;
      if (isMapBox) {
        response = await dio.get(input, queryParameters: data);
      } else {
        response = await dio.get('$baseURL$input');
      }
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> getWithBody(String methodName, data) async {
    try {
      final response = await dio.get("$baseURL$methodName", data: data);
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> getWithPath(String methodName, String path) async {
    try {
      final response = await dio.get(
        "$baseURL$methodName$path",
        options: Options(
          headers: {'Content-Type': 'application/json;charset=UTF-8'},
        ),
      );
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> patch(String methodName, {Map<String, dynamic>? data}) async {
    try {
      final response = await dio.patch(
        '$baseURL$methodName',
        queryParameters: data,
      );
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> post(String methodName, dynamic data) async {
    try {
      final response = await dio.post('$baseURL$methodName', data: data);
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> put(String methodName, Map<String, dynamic>? data) async {
    try {
      final response = await dio.put('$baseURL$methodName', data: data);
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> rawPost(String methodName, dynamic data) async {
    try {
      final headers = {'Content-Type': 'application/json;charset=UTF-8'};
      final dio = Dio();
      dio.interceptors.add(
        NetworkInterceptor(
          retryInterceptor: RetryInterceptor(
            dio: dio,
            connectivity: connectivity,
          ),
          tokenInterCeptor: TokenInterceptor(dio: dio),
        ),
      );
      if (kDebugMode) {
        dio.interceptors.add(
          LogInterceptor(requestBody: true, responseBody: true, error: true),
        );
      }
      final response = await dio.post(
        '$baseURL$methodName',
        data: data,
        options: Options(method: 'POST', headers: headers),
      );
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  @override
  Future<dynamic> rawPut(String methodName, String id, dynamic data) async {
    try {
      final headers = {'Content-Type': 'application/json;charset=UTF-8'};
      final dio = Dio();
      dio.interceptors.add(
        NetworkInterceptor(
          retryInterceptor: RetryInterceptor(
            dio: dio,
            connectivity: connectivity,
          ),
          tokenInterCeptor: TokenInterceptor(dio: dio),
        ),
      );
      if (kDebugMode) {
        dio.interceptors.add(
          LogInterceptor(requestBody: true, responseBody: true, error: true),
        );
      }
      final response = await dio.put(
        '$baseURL$methodName/$id',
        data: data,
        options: Options(method: 'PUT', headers: headers),
      );
      return returnResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Map<String, dynamic> returnResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return <String, dynamic>{
        "statusCode": response.statusCode,
        "data": response.data,
        "message": response.statusMessage,
      };
    } else {
      String message = 'Unexpected error';
      dynamic responseData = response.data;

      try {
        if (responseData is String) {
          responseData = jsonDecode(responseData);
        }
        if (responseData is Map<String, dynamic>) {
          message =
              responseData['message']?.toString() ??
              responseData['error_description']?.toString() ??
              responseData['error']?.toString() ??
              response.statusMessage ??
              'Server error';
        } else {
          message = response.statusMessage ?? 'Server error';
        }
      } catch (_) {
        message = response.statusMessage ?? 'Server error';
      }
      throw ServerException(message, response.statusCode);
    }
  }

  AppException _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return TimeoutException('Request timed out: ${e.message}');
    }

    if (e.type == DioExceptionType.connectionError ||
        (e.type == DioExceptionType.unknown && e.error is SocketException)) {
      return NetworkException('No internet connection: ${e.message}');
    }

    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      dynamic responseData = e.response!.data;
      String errorMessage = '';

      try {
        if (responseData is String) {
          responseData = jsonDecode(responseData);
        }
        if (responseData is Map<String, dynamic>) {
          errorMessage =
              responseData['message'] ??
              responseData['error_description'] ??
              responseData['error'] ??
              '';
        }

        if (errorMessage.trim().isEmpty) {
          errorMessage = e.response!.statusMessage ?? '';
        }
      } catch (_) {
        errorMessage = e.response!.statusMessage ?? 'Unknown error';
      }

      if (errorMessage.trim().isEmpty) {
        errorMessage = _getFallbackMessageFromStatusCode(statusCode);
      }

      switch (statusCode) {
        case 400:
          return ValidationException(errorMessage, statusCode);
        case 401:
          return UnauthorizedException(errorMessage, statusCode);
        case 403:
          return PermissionDeniedException(errorMessage, statusCode);
        case 404:
          return NotFoundException(errorMessage, statusCode);
        case 429:
          return RateLimitException(errorMessage, statusCode);
        case 503:
          return ServiceUnavailableException(errorMessage, statusCode);
        default:
          return ServerException(errorMessage, statusCode);
      }
    }
    return UnknownException('Dio error: ${e.message}');
  }

  String _getFallbackMessageFromStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
      case 403:
        return 'Authentication failed. Please log in again.';
      case 404:
        return 'Resource not found.';
      case 429:
        return 'Too many requests. Please try again later.';
      case 503:
        return 'Service Unavailable. Please try again later.';
      default:
        return 'An Unexpected server error occurred.';
    }
  }
}
