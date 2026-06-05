part of '../base_api.dart';

class ApiErrorException implements Exception {
  final String? apiError;

  const ApiErrorException({required this.apiError});

  @override
  String toString() => '$apiError';
}
