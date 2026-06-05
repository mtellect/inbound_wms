part of '../base_api.dart';

class UnsuccessfulApiStatusException implements Exception {
  final String? status;
  final String? message;
  final String? errorCode;

  const UnsuccessfulApiStatusException({
    required this.status,
    this.message,
    this.errorCode,
  });

  @override
  String toString() => '$message';
}
