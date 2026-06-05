part of base_api;

class AuthenticationInterceptor extends Interceptor {
  final Dio dio;

  final localdbService = getIt<LocaldbService>();

  AuthenticationInterceptor({
    required this.dio,
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }

    if (err.requestOptions.headers['Retry-Count'] == 1) {
      return handler.next(err);
    }

    //check if retry count is 1 (retry count gives number of attempt for refresh token renewable
    if (ApiClient.canRefreshToken(err)) {
      return _handleRefreshToken(err, handler);
    }

    return handler.next(err);
  }

  Future<APIResponseV2> _refreshToken() async {
    String accessToken = localdbService.getAccessToken();
    String refreshToken = localdbService.getRefreshToken();

    // In case of refresh token or auth token is empty
    // so to ignore error call fron renew token returning without having api call.
    if (refreshToken.isEmpty || accessToken.isEmpty) {
      return APIResponseV2(
        success: false,
        statusCode: HttpStatus.expectationFailed,
        message: 'FAIL',
        data: null,
      );
    }

    String url = "ApiUrl.loginRefreshPath";
    var response = await dio.post(
      url,
      data: {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      },
    );

    final data = response.bodyDecoded;

    if (response.statusCode != HttpStatus.ok) {
      return APIResponseV2(
        success: false,
        statusCode: response.statusCode,
        message: data['message'],
        data: null,
        errorCode: data['errorCode'],
      );
    }

    // final dataModel = AuthResponseModel.fromJson(data);
    // final res = dataModel.data;
    final accessTokenNew = "res?.accessToken";
    final refreshTokenNew = "res?.refreshToken";

    if (accessTokenNew != null && refreshTokenNew != null) {
      await localdbService.setAccessToken(
        accessToken: accessTokenNew,
        // refreshToken: refreshTokenNew,
      );

      return APIResponseV2(
        success: true,
        statusCode: response.statusCode,
        message: "success",
        data: null,
      );
    } else {
      return APIResponseV2(
        success: false,
        statusCode: response.statusCode,
        message: 'FAIL',
        data: null,
      );
    }
  }

  void _handleRefreshToken(DioException e, ErrorInterceptorHandler handler) async {
    if (ApiClient.hasRefreshedToken(e) || ApiClient.hasTriedRefreshToken(e)) {
      return handler.next(e);
    }

    // If a 401 response is received, refresh the access token
    APIResponseV2 res = await _refreshToken();

    // Update the request header with the new access token
    if (res.success == true) {
      String token = localdbService.getAccessToken();
      e.requestOptions.headers['Authorization'] = "Bearer $token";
      e.requestOptions.headers['Retry-Count'] = 1;

      // Repeat the request with the updated header
      return handler.resolve(await dio.fetch(e.requestOptions));
    }
    //In case of refresh token api fails or got any unexpected error
    // it will let the other calls go.
    return handler.next(e);
  }
}
