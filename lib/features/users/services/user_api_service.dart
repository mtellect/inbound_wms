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
}
