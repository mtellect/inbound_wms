import 'package:flutter/material.dart';
import 'package:inbound_ms/core/startup/startup_service.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Phase 1: Initialize all dependencies and services via GetIt & Supabase
  await StartUpService.instance.initializeApp();
  
  runApp(const InboundApp());
}

class InboundApp extends StatelessWidget {
  const InboundApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve our AppRouter singleton from GetIt
    final appRouter = getIt<AppRouter>();

    return MaterialApp.router(
      title: 'Warehouse Inbound MS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
