part of 'base_api.dart';

class EnvConfigurationsModel {
  final ApiEnvironmentEnum envType;
  final String baseUrl;
  final String flavor;
  final String mapBoxAccessToken;
  final String googleMapsApiKey;
  final String googleMapKeyIos;
  final String googleMapKeyAndroid;

  const EnvConfigurationsModel._internal({
    required this.envType,
    required this.baseUrl,
    required this.flavor,
    required this.mapBoxAccessToken,
    required this.googleMapsApiKey,
    required this.googleMapKeyIos,
    required this.googleMapKeyAndroid,
  });

  static const EnvConfigurationsModel _env = EnvConfigurationsModel._internal(
    envType: InboundWebEnvironmentEnum.staging,
    flavor: String.fromEnvironment('FLAVOR'),
    baseUrl: String.fromEnvironment('BASE_URL'),
    mapBoxAccessToken: String.fromEnvironment('MAP_BOX_ACCESS_TOKEN'),
    googleMapsApiKey: String.fromEnvironment('GOOGLE_MAPS_API_KEY'),
    googleMapKeyIos: String.fromEnvironment('GOOGLE_MAP_KEY_IOS'),
    googleMapKeyAndroid: String.fromEnvironment('GOOGLE_MAP_KEY_ANDROID'),
  );

  factory EnvConfigurationsModel({
    required ApiEnvironmentEnum env,
  }) {
    return _env.copyWith(envType: env);
  }

  // Expose the singleton instance
  static EnvConfigurationsModel get instance => _env;

  EnvConfigurationsModel copyWith({
    final ApiEnvironmentEnum? envType,
    final String? baseUrl,
    final String? flavor,
    final String? mapBoxAccessToken,
    final String? googleMapsApiKey,
    final String? googleMapKeyIos,
    final String? googleMapKeyAndroid,
  }) {
    return EnvConfigurationsModel._internal(
      envType: envType ?? this.envType,
      baseUrl: baseUrl ?? this.baseUrl,
      flavor: flavor ?? this.flavor,
      mapBoxAccessToken: mapBoxAccessToken ?? this.mapBoxAccessToken,
      googleMapsApiKey: googleMapsApiKey ?? this.googleMapsApiKey,
      googleMapKeyIos: googleMapKeyIos ?? this.googleMapKeyIos,
      googleMapKeyAndroid: googleMapKeyAndroid ?? this.googleMapKeyAndroid,
    );
  }
}
