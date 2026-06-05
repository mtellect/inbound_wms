import 'package:uuid/uuid.dart';

class UuidUtils {
  static const _uuid = Uuid();

  /// Generate a standard v4 random UUID
  static String generate() {
    return _uuid.v4();
  }

  /// Generate a deterministic v5 UUID based on a string name
  static String generateFromString(String name) {
    return _uuid.v5(Uuid.NAMESPACE_URL, name);
  }

  /// Check if a string is a valid standard UUID
  static bool isValid(String uuid) {
    final regex = RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$');
    return regex.hasMatch(uuid);
  }

  /// Ensures a string is a valid UUID. If not, generates a v5 UUID from it. 
  /// Returns null if the input is empty or null.
  static String? ensureValidOrGenerate(String? input) {
    if (input == null || input.trim().isEmpty) return null;
    return isValid(input) ? input : generateFromString(input);
  }
}
