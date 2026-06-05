import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inbound_ms/features/users/models/app_user.dart';
import 'package:inbound_ms/features/users/services/dto/app_user_dto.dart';
import 'package:inbound_ms/features/users/services/mappers/app_user_mapper.dart';
import 'i_user_api_service.dart';

class UserApiService implements IUserApiService {
  final SupabaseClient _supabaseClient;

  UserApiService({required this._supabaseClient});

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
    required String displayName,
    required String role,
    required String status,
  }) async {
    // Note: In Supabase, inserting into user_roles will fail unless an auth.user exists.
    // For a fully robust solution, an Edge Function to create the auth user is needed.
    // Alternatively, if auth is handled via a trigger on signup, we might just invite the user here.
    // For now, we simulate calling an edge function or just do an insert assuming they sign up.
    try {
       await _supabaseClient.from('user_roles').insert({
        // 'id' would typically come from auth.users, maybe we shouldn't generate it here
        // if the FK is enforced. We will throw an error to surface it or just invite user.
        'email': email,
        'display_name': displayName,
        'role': role,
        'status': status,
      });
    } catch(e) {
      // Re-throw or handle the foreign key constraint issue gracefully for the demo
      throw Exception('Creating users requires an Admin Edge Function. Real implementation pending.');
    }
  }
}
