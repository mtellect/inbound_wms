abstract class EnvironmentKeys {
  static const prod = 'prod';
  static const staging = 'staging';
}

sealed class ApiEnvironmentEnum {
  const ApiEnvironmentEnum(this.key);
  final String key;
}

enum AppFlavor {
  inboundWeb,
  inboundMobile
  ;

  factory AppFlavor.fromKey(String? key) {
    key = key?.toLowerCase();
    return switch (key) {
      null => AppFlavor.inboundWeb,
      _ when key.contains('mobile') => AppFlavor.inboundMobile,
      _ when key.contains('web') => AppFlavor.inboundWeb,
      _ => AppFlavor.inboundWeb,
    };
  }
}

enum InboundWebEnvironmentEnum implements ApiEnvironmentEnum {
  prod(EnvironmentKeys.prod),
  staging(EnvironmentKeys.staging)
  ;

  const InboundWebEnvironmentEnum(this.key);
  factory InboundWebEnvironmentEnum.fromKey(String? key) {
    return switch (key?.contains('prod')) {
      true => InboundWebEnvironmentEnum.prod,
      _ => InboundWebEnvironmentEnum.staging,
    };
  }

  @override
  final String key;
}

enum InboundMobileEnvironmentEnum implements ApiEnvironmentEnum {
  prod(EnvironmentKeys.prod),
  staging(EnvironmentKeys.staging)
  ;

  const InboundMobileEnvironmentEnum(this.key);

  factory InboundMobileEnvironmentEnum.fromKey(String? key) {
    return switch (key?.contains('prod')) {
      true => InboundMobileEnvironmentEnum.prod,
      _ => InboundMobileEnvironmentEnum.staging,
    };
  }

  @override
  final String key;
}

// Helper method to get any Environment from key
ApiEnvironmentEnum getEnvironmentFromKey(String? key) {
  return switch (AppFlavor.fromKey(key)) {
    AppFlavor.inboundMobile => InboundMobileEnvironmentEnum.fromKey(key),
    AppFlavor.inboundWeb => InboundWebEnvironmentEnum.fromKey(key),
  };
}
