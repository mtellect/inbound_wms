part of '../base_api.dart';

class NoDataException implements Exception {
  final String? status;
  final String? message;

  const NoDataException({required this.status, this.message});

  @override
  String toString() => '$message';
}
