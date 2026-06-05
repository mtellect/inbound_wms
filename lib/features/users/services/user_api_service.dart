import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inbound_ms/features/users/models/app_user.dart';
import 'package:inbound_ms/features/users/services/dto/app_user_dto.dart';
import 'package:inbound_ms/features/users/services/mappers/app_user_mapper.dart';
import 'i_user_api_service.dart';

import 'package:inbound_ms/core/api/base_api.dart';

class UserApiService implements IUserApiService {
  final SupabaseClient _supabaseClient;
  final ApiClient _apiClient;

  UserApiService({
    required this._supabaseClient,
    required this._apiClient,
  });

  @override
  Future<List<AppUser>> fetchAllUsers() async {
    final response = await _supabaseClient.from('user_roles').select('*');

    return (response as List).map((row) {
      final dto = AppUserDto.fromJson(row);
      return AppUserMapper.fromDto(dto);
    }).toList();
  }

  @override
  Future<void> updateUserStatus(String userId, String status) async {
    await _supabaseClient.from('user_roles').update({'status': status}).eq('id', userId);
  }

  @override
  Future<void> updateUserRole(String userId, String role) async {
    await _supabaseClient.from('user_roles').update({'role': role}).eq('id', userId);
  }

  @override
  Future<void> createUser({
    required String email,
    required String password,
    required String displayName,
    required String role,
    required String status,
    required bool requiresPasswordReset,
  }) async {
    // We use ApiClient to hit the Supabase Admin Auth API directly with the service_role key
    try {
      final env = EnvConfigurationsModel.instance;
      
      final response = await _apiClient.postApi(
        url: '${env.supabaseUrl}/auth/v1/admin/users',
        headers: {
          'apikey': env.supabaseServiceRoleKey,
          'Authorization': 'Bearer ${env.supabaseServiceRoleKey}',
          'Content-Type': 'application/json',
        },
        body: {
          'email': email,
          'password': password,
          'email_confirm': true,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final userId = response.data['id'];
        
        // Insert the user into public.user_roles
        await _supabaseClient.from('user_roles').insert({
          'id': userId,
          'email': email,
          'display_name': displayName,
          'role': role,
          'status': status,
          'requires_password_reset': requiresPasswordReset,
        });
      } else {
        throw Exception('Failed to create user: ${response.data}');
      }
    } catch(e) {
      throw Exception('Failed to create user via HTTP request. Error: $e');
    }
  }
}
