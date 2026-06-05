abstract interface class IStartUpService {
  Future<void> registerNetwork();
  Future<void> registerServices();
  Future<void> registerControllers();
  Future<void> initializeApp();
}
