part of base_api;

class HeadersInterceptor extends Interceptor {
  final localdbService = getIt<LocaldbService>();
  // final _base = getItNew.get<EnvConfigurationsNew>();

  Map<String, String> get baseRootHeaders {
    Map<String, String> appRootHeader = {
      // 'appVersion': AppVersionCheck.appVersion,
      // 'deviceId': AppVersionCheck.deviceId,

      // "X-API-KEY": "H7QzFHJx4w46fI5Uzi4RvtTwlEXpdgYUH",
      'deviceType': kIsWeb ? 'web' : Platform.operatingSystem,
    };

    Map<String, String> baseHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // if (_base.isPreprod) 'preprod': 'true',
    };

    baseHeaders.addAll(appRootHeader);

    return baseHeaders;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // If it's an absolute URL (like Mapbox or Google), don't attach standard API headers that might cause CORS or auth issues
    // if (options.extra['isAbsoluteUrl'] == true || options.path.startsWith('http')) {
    //   log("Options (Absolute): ${options.headers}");
    //   return handler.next(options);
    // }

    final customHeaders = baseRootHeaders;
    String token = localdbService.getAccessToken();
    // token = "6|o8pXlTPTTPqbfrJ8hyQ2dVYrYzlXZXDFJmsVuFKta7318bec";
    if (token != "") {
      Map<String, String>? header = {"Authorization": "Bearer $token"};
      customHeaders.addAll(header);
    }

    // options.method == "GET";
    options.headers.addAll(customHeaders);

    log("Options : ${options.headers}");
    log("Options-Path : ${options.path}");
    return handler.next(options);
  }
}
