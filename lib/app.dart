import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/core/startup/startup_service.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';
import 'package:inbound_ms/core/enums/api_environment_enum.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';

Future<void> runApplication({required ApiEnvironmentEnum environment}) async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize all dependencies and services via GetIt & Supabase
  await StartUpService.instance.initializeApp(environment: environment);
  
  runApp(const App());
}

final appNavKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt.get<AuthProvider>()),
        ChangeNotifierProvider.value(value: getIt.get<PurchaseOrderProvider>()),
      ],
      builder: (context, _) {
        return MaterialApp.router(
          title: 'Inbound MS',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
            useMaterial3: true,
          ),
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
