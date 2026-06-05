library base_api;

import 'dart:convert';
import 'dart:io';

import 'package:inbound_ms/core/enums/api_environment_enum.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import 'dart:developer';

import 'package:inbound_ms/features/local_db/base_local_db.dart';
import 'package:inbound_ms/core/startup/startup_service.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'api_client.dart';
part 'api_functions.dart';
part 'api_urls.dart';
part 'api_response.dart';
part 'interceptors/headers_interceptor.dart';
part 'interceptors/error_interceptor.dart';
part 'interceptors/authentication_interceptor.dart';
part 'interceptors/body_interceptor.dart';
part 'interceptors/connectivity_interceptor.dart';
part 'exception/api_cancelled_exception.dart';
part 'exception/api_error_exception.dart';
part 'exception/no_content_exception.dart';
part 'exception/unsuccessful_api_status_exception.dart';
part 'env_configurations_model.dart';
