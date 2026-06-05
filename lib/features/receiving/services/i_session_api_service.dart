import 'package:inbound_ms/features/receiving/models/scan_session.dart';

abstract class ISessionApiService {
  Future<List<ScanSession>> fetchAllSessions();
  Future<ScanSession> fetchSessionById(String id);
  Future<void> createSession(ScanSession session);
  Future<void> updateSessionStatus(String id, String status);
}
