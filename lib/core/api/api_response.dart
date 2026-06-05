part of base_api;

/// Basic API Response from server
class APIResponseV2<T> {
  final bool? success;
  final int? statusCode;
  final String? message;
  final T? data;
  final String? errorCode;

  APIResponseV2({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
    this.errorCode,
  });
}

extension ResponseExtension on Response {
  /// This is used to get the raw response body without decoding
  get body => data;

  get bodyDecoded {
    try {
      if (data is Map) return data;
      return Map<String, dynamic>.from(jsonDecode(data));
    } catch (e) {
      return data;
    }
  }

  get bodyData => bodyDecoded["data"];

  // String get errorMessages => null == bodyDecoded["messages"]
  //     ? "Something went wrong"
  //     : List.from(bodyDecoded["messages"]).join();

  String get errorMessages => null == bodyDecoded
      ? "Something went wrong"
      : bodyDecoded["message"] ?? "Something went wrong";

  String? get errorFlag => bodyDecoded['errorCode'];

  String get messageData => bodyDecoded['message'] ?? "Something went wrong";

  Map<String, dynamic> get errors => bodyDecoded["errors"];

  bool get isRequestSuccess => [HttpStatus.ok, HttpStatus.created].contains(statusCode);
}
