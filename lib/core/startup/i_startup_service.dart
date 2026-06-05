import 'package:inbound_ms/core/enums/api_environment_enum.dart';

abstract interface class IStartUpService {
  Future<void> registerNetwork();
  Future<void> registerServices({required ApiEnvironmentEnum environment});
  Future<void> registerControllers();
  Future<void> initializeApp({required ApiEnvironmentEnum environment});
}
