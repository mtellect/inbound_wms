part of base_api;

class BodyInterceptor extends Interceptor {
  final localdbService = getIt<LocaldbService>();
  // final _base = getItNew.get<EnvConfigurationsNew>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token = localdbService.getAccessToken();

    // 🔹 Add token to FormData body if applicable
    if (options.data is FormData) {
      final formData = options.data as FormData;
      formData.fields.add(MapEntry("token", token));
      // formData.fields.add(MapEntry("access_token", token));
      options.data = formData;
    }

    return handler.next(options);
  }
}
