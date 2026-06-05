import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  
  @override
  List<AutoRoute> get routes => [
    // We will add specific routes for Auth, Web Dashboard, and Mobile Scanner here.
  ];
}
