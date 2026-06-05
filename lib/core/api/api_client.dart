// ignore_for_file: avoid_print
part of base_api;

typedef OnNewAuthEnabledGet = bool Function();

class ApiClient {
  // reduced the timeout time to 60 secs i observed that due to early token expiry
  // which causes auto re-routing to login/signup page, response sometimes get lost
  // and is not returned to the previous caller.
  static const timeout = Duration(seconds: 60);

  final Dio _dio;
  final VoidCallback onLogout;
  // final VoidCallback onCartError;
  // final EnvConfigurationsNew envConfiguration;

  factory ApiClient.init({
    // required EnvConfigurationsNew envConfiguration,
    required VoidCallback onLogout,
  }) {
    return ApiClient._(
      // envConfiguration: envConfiguration,
      onLogout: onLogout,
    );
  }

  @visibleForTesting
  factory ApiClient.testInstance({
    required Dio dio,
    required VoidCallback onLogout,
    // required VoidCallback onCartError,
  }) {
    return ApiClient._(
      // envConfiguration: envConfiguration,
      onLogout: onLogout,
      dio: dio,
    );
  }

  ApiClient._({
    // required this.envConfiguration,
    required this.onLogout,
    Dio? dio,
  }) : _dio =
           dio ??
           Dio(
             BaseOptions(
               receiveDataWhenStatusError: true,
               connectTimeout: timeout,
               receiveTimeout: timeout,
               sendTimeout: timeout,
             ),
           ) {
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.addAll([
      // for chucker
      if (ChuckerFlutter.showOnRelease) ChuckerDioInterceptor(),

      /// (WIP)
      // ConnectivityInterceptor(dio: _dio),

      // for handling headers
      HeadersInterceptor(),

      // for handling body
      // BodyInterceptor(),

      // for handling authentication/refresh token
      AuthenticationInterceptor(dio: _dio),

      // for handling errors
      ErrorInterceptor(dio: _dio, onLogout: onLogout),
    ]);
  }

  static bool canRefreshToken(DioException e) => e.response?.statusCode == 401;

  static bool hasTriedRefreshToken(DioException e) =>
      e.response?.statusCode == 400 && e.requestOptions.headers['Retry-Count'] == 1;

  static bool hasRefreshedToken(DioException e) =>
      e.response?.statusCode == 400 &&
      e.response?.realUri.toString().contains("ApiUrl.loginRefreshPath") == true;

  static bool isRefreshTokenUrl(DioException e) =>
      e.response?.realUri.toString().contains("ApiUrl.loginRefreshPath") == true;
}
