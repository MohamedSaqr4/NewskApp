 import 'package:dio/dio.dart';
import 'package:news_app/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({required this.errorModel});
}

 handleDioException(DioException e) {
  final data = e.response?.data; 
  ErrorModel safeError(){
    try {
      if (data != null && data is Map<String, dynamic>) {
        return ErrorModel.fromJson(data);
      }
      return ErrorModel(
        status: 'error',
        code: e.response?.statusCode?.toString() ?? 'unknown',
        message: e.message ?? 'Unknown error',
      );
    } catch (_) {
      return ErrorModel(
        status: 'error',
        code: 'parse_error',
        message: 'Failed to parse error response',
      );
    }
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
    case DioExceptionType.badResponse:
      throw ServerException(errorModel: safeError());
    default:
      throw ServerException(
        errorModel: ErrorModel(
          status: 'error',
          code: 'unhandled_error',
          message: 'Unhandled Dio error: ${e.message}',
        ),
      );
  }

}
