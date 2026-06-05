import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inbound_ms/core/constants/env.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';
import 'package:inbound_ms/core/enums/api_environment_enum.dart';
import 'package:inbound_ms/core/services/i_environment_service.dart';
import 'package:inbound_ms/core/services/environment_service.dart';
import 'package:inbound_ms/core/api/base_api.dart';

import 'package:inbound_ms/features/auth/services/i_authentication_api_service.dart';
import 'package:inbound_ms/features/auth/services/authentication_api_service.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';

import 'package:inbound_ms/features/purchase_orders/services/i_purchase_order_api_service.dart';
import 'package:inbound_ms/features/purchase_orders/services/purchase_order_api_service.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';

import 'package:inbound_ms/features/dashboard/services/i_dashboard_api_service.dart';
import 'package:inbound_ms/features/dashboard/services/mock_dashboard_api_service.dart';
import 'package:inbound_ms/features/dashboard/providers/dashboard_provider.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:inbound_ms/core/theme/i_theme_provider.dart';
import 'package:inbound_ms/core/theme/app_theme_provider.dart';
import 'package:inbound_ms/core/theme/web_theme_provider.dart';

import 'i_startup_service.dart';

final getIt = GetIt.instance;

class StartUpService implements IStartUpService {
  StartUpService._();
  static final StartUpService instance = StartUpService._();

  @override
  Future<void> registerNetwork() async {
    // Initialize Supabase Client
    await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseAnonKey);

    // Register the client in GetIt for easy access in our Feature Services
    getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);
  }

  @override
  Future<void> registerServices({required ApiEnvironmentEnum environment}) async {
    // 0. Environment
    getIt.registerLazySingleton<EnvConfigurationsModel>(
      () => EnvConfigurationsModel(env: environment),
    );

    getIt.registerLazySingleton<IEnvironmentService>(
      () => EnvironmentService(environment: environment),
    );

    // Register Feature Services
    getIt.registerLazySingleton<IAuthenticationApiService>(
      () => AuthenticationApiService(supabaseClient: getIt.get<SupabaseClient>()),
    );

    getIt.registerLazySingleton<IPurchaseOrderApiService>(
      () => PurchaseOrderApiService(supabaseClient: getIt.get<SupabaseClient>()),
    );

    getIt.registerLazySingleton<IDashboardApiService>(
      () => MockDashboardApiService(),
    );
  }

  @override
  Future<void> registerControllers() async {
    // Register State Providers
    getIt.registerLazySingleton<AuthProvider>(
      () => AuthProvider(authenticationApiService: getIt.get<IAuthenticationApiService>()),
    );

    getIt.registerLazySingleton<PurchaseOrderProvider>(
      () => PurchaseOrderProvider(purchaseOrderApiService: getIt.get<IPurchaseOrderApiService>()),
    );

    getIt.registerLazySingleton<DashboardProvider>(
      () => DashboardProvider(dashboardApiService: getIt.get<IDashboardApiService>()),
    );

    getIt.registerLazySingleton<IThemeProvider>(
      () => switch (kIsWeb) {
        true => WebThemeProvider(),
        false => AppThemeProvider(),
      },
    );

    // Register AppRouter for declarative navigation (Needs AuthProvider)
    getIt.registerSingleton<AppRouter>(AppRouter(authProvider: getIt.get<AuthProvider>()));
  }

  @override
  Future<void> initializeApp({required ApiEnvironmentEnum environment}) async {
    await registerNetwork();
    await registerServices(environment: environment);
    await registerControllers();
  }
}
