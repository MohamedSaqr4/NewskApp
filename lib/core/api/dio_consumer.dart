import 'package:dio/dio.dart';
import 'package:news_app/core/api/api_consumer.dart';
import 'package:news_app/core/api/api_interceptor.dart';
import 'package:news_app/core/constant.dart';
import 'package:news_app/core/errors/server_exceptions.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = AppConstants.baseUrl;
    dio.options.receiveDataWhenStatusError = true;
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
    dio.interceptors.add(ApiInterceptor());
  }

  @override
  Future getRequest(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.get(path,
          data: isFormData && data != null ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
     throw handleDioException(e);
    }
  }

  @override
  Future postRequest(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(path,
          data: isFormData && data != null ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
   throw   handleDioException(e);
    }
  }

  @override
  Future patchRequest(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(path,
          data: isFormData && data != null ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
    throw  handleDioException(e);
    }
  }

  @override
  Future deleteRequest(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData && data != null ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
   throw   handleDioException(e);
    }
  }
}
