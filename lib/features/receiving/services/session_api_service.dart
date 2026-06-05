import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inbound_ms/features/receiving/models/scan_session.dart';
import 'package:inbound_ms/features/receiving/services/dto/scan_session_dto.dart';
import 'package:inbound_ms/features/receiving/services/mappers/scan_session_mapper.dart';
import 'i_session_api_service.dart';

class SessionApiService implements ISessionApiService {
  final SupabaseClient _supabaseClient;

  SessionApiService({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  @override
  Future<List<ScanSession>> fetchAllSessions() async {
    final response = await _supabaseClient
        .from('receiving_sessions')
        .select('*, user_roles:operator_id(display_name), purchase_orders:po_id(po_number)');
    
    return (response as List).map((row) {
      final dto = ScanSessionDto.fromJson(row);
      return ScanSessionMapper.fromDto(dto);
    }).toList();
  }

  @override
  Future<ScanSession> fetchSessionById(String id) async {
    final response = await _supabaseClient
        .from('receiving_sessions')
        .select('*, user_roles:operator_id(display_name), purchase_orders:po_id(po_number)')
        .eq('id', id)
        .single();
        
    final dto = ScanSessionDto.fromJson(response);
    return ScanSessionMapper.fromDto(dto);
  }

  @override
  Future<void> createSession(ScanSession session) async {
    final dto = ScanSessionMapper.toDto(session);
    final json = dto.toJson();
    json.removeWhere((key, value) => value == null || key == 'user_roles' || key == 'purchase_orders');
    await _supabaseClient.from('receiving_sessions').insert(json);
  }

  @override
  Future<void> updateSessionStatus(String id, String status) async {
    await _supabaseClient
        .from('receiving_sessions')
        .update({'status': status})
        .eq('id', id);
  }
}
