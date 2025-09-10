import 'package:news_app/core/api/end_points.dart';

class ErrorModel {
  final String status;
  final String code;
  final String message;

  ErrorModel({
    required this.status,
    required this.code,
    required this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json[ApiKey.status] ?? 'error',
      code: json[ApiKey.code]?.toString() ?? '404',
      message: json[ApiKey.message] ?? 'Something went wrong',
    );
  }
}
