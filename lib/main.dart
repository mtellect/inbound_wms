import 'package:inbound_ms/app.dart';
import 'package:inbound_ms/core/enums/api_environment_enum.dart';

void main() async {
  const flavorString = String.fromEnvironment('FLAVOR');
  final environment = getEnvironmentFromKey(flavorString);
  
  runApplication(environment: environment);
}
