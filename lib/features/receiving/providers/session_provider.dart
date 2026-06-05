import 'package:flutter/foundation.dart';
import 'package:inbound_ms/features/receiving/models/scan_session.dart';
import 'package:inbound_ms/features/receiving/services/i_session_api_service.dart';

class SessionProvider extends ChangeNotifier {
  final ISessionApiService _sessionApiService;

  SessionProvider({required this._sessionApiService});

  List<ScanSession> _sessions = [];
  List<ScanSession> get sessions => _sessions;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchSessions() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _sessions = await _sessionApiService.fetchAllSessions();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateSessionStatus(String sessionId, String status) async {
    try {
      await _sessionApiService.updateSessionStatus(sessionId, status);
      await fetchSessions();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> createSession(ScanSession session) async {
    try {
      await _sessionApiService.createSession(session);
      await fetchSessions();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      rethrow;
    }
  }
}
