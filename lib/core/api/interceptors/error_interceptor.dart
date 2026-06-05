part of base_api;

class ErrorInterceptor extends Interceptor {
  const ErrorInterceptor({required this.dio, required this.onLogout});

  final Dio dio;
  final VoidCallback onLogout;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log("ErrorInterceptor realUri ${err.response?.statusCode} ${err.response?.realUri}");

    if (err.response?.statusCode == HttpStatus.unauthorized) {
      log("ErrorInterceptor 401 onLogout");
      onLogout.call();
      return handler.reject(err);
    }

    if (_canHandleApiError(err)) {
      log("ErrorInterceptor _canHandleApiError ${err.response?.statusCode}");
      return _handleApiError(err, handler);
    }

    //check if retry count is 1 (retry count gives number of attempt for refresh token renewable
    if (ApiClient.hasRefreshedToken(err) || ApiClient.hasTriedRefreshToken(err)) {
      log("ErrorInterceptor onLogout ${err.response?.statusCode}");
      onLogout.call();
      return handler.reject(err);
    }

    log("ErrorInterceptor regular ${err.response?.statusCode}");
    _reportApiToAmplitude(e: err);
    return handler.next(err);
  }

  bool _canHandleApiError(DioException e) {
    return [
      if (!ApiClient.isRefreshTokenUrl(e)) HttpStatus.badRequest,
      HttpStatus.badRequest,
      HttpStatus.notFound,
      HttpStatus.forbidden,
      HttpStatus.internalServerError,
      HttpStatus.unprocessableEntity,
      HttpStatus.notImplemented,
    ].contains(e.response?.statusCode);
  }

  Response _handle404(DioException e) {
    String? message;
    String? errorCode;
    Map<String, dynamic> errors = {};
    try {
      final data = e.response?.data;
      if (data is Map<String, dynamic>) {
        // Primary message
        if (data['message'] is String) {
          message = data['message'];
        }

        if (data['error'] is String) {
          message = data['error'];
        }

        // Detailed field errors override message
        if (data['errors'] is Map) {
          errors = data['errors'];
          final errorsMap = Map<String, dynamic>.from(data['errors']);

          final allErrors = errorsMap.values
              .whereType<List>()
              .expand((e) => e.whereType<String>())
              .toList();

          if (allErrors.isNotEmpty) {
            message = allErrors.join(', ');
          }
        }

        if (data['error_flag'] != null) {
          errorCode = data['error_flag'].toString();
        }
      }
    } catch (e) {
      message = "Something went wrong";
      errorCode = "wrong_parse_error";
    }

    log("_handle404 $message data ${e.response?.data}");
    return Response(
      requestOptions: e.requestOptions,
      statusCode: e.response?.statusCode ?? 404,
      data: {
        'error': true,
        'message': message,
        'errorCode': errorCode,
        'errors': errors,
      },
    );
  }

  Future _reportApiToAmplitude({required DioException e}) async {}

  void _handleApiError(DioException e, ErrorInterceptorHandler handler) {
    log("ErrorInterceptor 11 -- others ${e.response?.statusCode}");

    // if (e.response?.statusCode == HttpStatus.internalServerError) {
    //   return handler.resolve(
    //     Response(
    //       requestOptions: e.requestOptions,
    //       statusCode: e.response?.statusCode, // You can set your custom status code
    //       statusMessage: 'Something went wrong!!!',
    //     ),
    //   );
    // }

    return handler.resolve(_handle404(e));
  }

  // /// Can be used for custom exception handling
  // DioException _handleInternalServerError(DioException e) {
  //   final statusCode = e.response?.statusCode;
  //   return DioException(
  //     requestOptions: e.requestOptions,
  //     response: Response(
  //       requestOptions: e.requestOptions,
  //       statusCode: statusCode, // You can set your custom status code
  //       statusMessage: 'Something went wrong!!!',
  //     ),
  //   );
  // }
}
