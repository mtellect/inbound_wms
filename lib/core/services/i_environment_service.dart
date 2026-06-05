import 'package:inbound_ms/core/enums/api_environment_enum.dart';

abstract interface class IEnvironmentService {
  bool get isProduction;
  bool get isStaging;
  bool get isDevelopment;
  AppFlavor get appFlavor;

  bool get isMobile;
  bool get isWeb;

  String get role;
}
