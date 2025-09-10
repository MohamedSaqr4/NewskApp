import 'package:dio/dio.dart';
import 'package:news_app/core/constant.dart';

//if i need to send some thing with request not in request
class ApiInterceptor extends Interceptor {
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.putIfAbsent('apiKey', () => AppConstants.apikey);
    super.onRequest(options, handler);
  }
}
