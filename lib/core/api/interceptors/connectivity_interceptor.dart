part of base_api;

class ConnectivityInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;

  ConnectivityInterceptor({
    required this.dio,
    this.maxRetries = 2,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final connected = await InternetConnection().hasInternetAccess;

    if (!connected) {
      return handler.resolve(
        Response(
          requestOptions: options,
          statusCode: HttpStatus.networkConnectTimeoutError,
          data: {
            'error': true,
            'message': 'No Internet Connection',
            'errorCode': 'No Internet Connection',
          },
        ),
      );
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;

    // 🔐 Do not retry blocked URLs
    if (_isInNoRetryList(options.path)) {
      return handler.next(err);
    }

    // Do not retry offline errors – UI handles Retry CTA
    if (err.type == DioExceptionType.connectionError) {
      return handler.next(err);
    }

    // Retry only transient failures
    if (_shouldRetry(err)) {
      final currentRetries = options.extra['retries'] ?? 0;

      if (currentRetries < maxRetries) {
        options.extra['retries'] = currentRetries + 1;
        await Future.delayed(const Duration(milliseconds: 500));

        try {
          final response = await dio.fetch(options);
          return handler.resolve(response);
        } catch (_) {}
      }
    }

    return handler.next(err);
  }

  bool _shouldRetry(DioException err) =>
      err.type == DioExceptionType.connectionTimeout ||
      err.type == DioExceptionType.sendTimeout ||
      err.type == DioExceptionType.receiveTimeout;

  bool _isInNoRetryList(String path) => noRetryUrls.any((blocked) => path.contains(blocked));

  List get noRetryUrls => [
    '/loginv3',
    '/signupv2',
    '/pay_order_loan',
    '/pay_repayment',
  ];
}
