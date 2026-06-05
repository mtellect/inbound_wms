part of 'base_api.dart';

class EnvConfigurationsModel {
  final ApiEnvironmentEnum envType;
  final String baseUrl;
  final String flavor;
  final String supabaseUrl;
  final String supabaseAnonKey;
  final String supabaseServiceRoleKey;

  const EnvConfigurationsModel._internal({
    required this.envType,
    required this.baseUrl,
    required this.flavor,
    required this.supabaseUrl,
    required this.supabaseAnonKey,
    required this.supabaseServiceRoleKey,
  });

  static const EnvConfigurationsModel _env = EnvConfigurationsModel._internal(
    envType: InboundWebEnvironmentEnum.staging,
    baseUrl: String.fromEnvironment('BASE_URL'),
    flavor: String.fromEnvironment('FLAVOR'),
    supabaseUrl: String.fromEnvironment('SUPABASE_URL'),
    supabaseAnonKey: String.fromEnvironment('SUPABASE_ANON_KEY'),
    supabaseServiceRoleKey: String.fromEnvironment('SUPABASE_SERVICE_ROLE_KEY'),
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
    final String? supabaseUrl,
    final String? supabaseAnonKey,
    final String? supabaseServiceRoleKey,
  }) {
    return EnvConfigurationsModel._internal(
      envType: envType ?? this.envType,
      baseUrl: baseUrl ?? this.baseUrl,
      flavor: flavor ?? this.flavor,
      supabaseUrl: supabaseUrl ?? this.supabaseUrl,
      supabaseAnonKey: supabaseAnonKey ?? this.supabaseAnonKey,
      supabaseServiceRoleKey: supabaseServiceRoleKey ?? this.supabaseServiceRoleKey,
    );
  }
}
