import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:dw9_delivery_app/app/core/config/env/env.dart';
import 'package:dw9_delivery_app/app/core/rest_client/auth_interceptors.dart';

class CustomDio extends DioForNative {
  late AuthInterceptor _authInterceptors;

  CustomDio()
      : super(BaseOptions(
          baseUrl: Env.instance['backend_base_url'] ?? '',
          connectTimeout: 5000,
          receiveTimeout: 60000,
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    _authInterceptors = AuthInterceptor();
  }

  CustomDio auth() {
    interceptors.add(_authInterceptors);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptors);
    return this;
  }
}
