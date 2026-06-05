import 'i_environment_service.dart';
import 'package:inbound_ms/core/enums/api_environment_enum.dart';

class EnvironmentService implements IEnvironmentService {
  const EnvironmentService({required this.environment});

  final ApiEnvironmentEnum environment;

  @override
  bool get isProduction => environment.key == EnvironmentKeys.prod;

  @override
  bool get isStaging => environment.key == EnvironmentKeys.staging;

  @override
  AppFlavor get appFlavor {
    return switch (environment) {
      InboundWebEnvironmentEnum.prod ||
      InboundWebEnvironmentEnum.staging => AppFlavor.inboundWeb,
      InboundMobileEnvironmentEnum.prod ||
      InboundMobileEnvironmentEnum.staging => AppFlavor.inboundMobile,
    };
  }

  @override
  bool get isDevelopment => environment.key == EnvironmentKeys.staging;

  @override
  bool get isMobile => appFlavor == AppFlavor.inboundMobile;

  @override
  bool get isWeb => appFlavor == AppFlavor.inboundWeb;

  @override
  String get role => isMobile ? "worker" : "manager";
}
