part of 'app_router.dart';

// Some Custom route methods to be used in the app
class TransitionRoute extends CustomRoute {
  TransitionRoute({required super.page});

  TransitionRoute.fadeIn({
    required super.page,
    super.fullscreenDialog,
    super.children,
    super.guards,
    super.initial,
    super.path,
    super.maintainState,
    super.opaque,
  }) : super(
         transitionsBuilder: TransitionsBuilders.fadeIn,
         duration: const Duration(milliseconds: 200),
       );

  TransitionRoute.slideLeft({
    required super.page,
    super.fullscreenDialog,
    super.children,
    super.guards,
    super.initial,
    super.path,
    super.maintainState,
    super.opaque,
  }) : super(
         transitionsBuilder: TransitionsBuilders.slideLeft,
         duration: const Duration(milliseconds: 200),
       );
       
  TransitionRoute.slideTop({
    required super.page,
    super.fullscreenDialog,
    super.children,
    super.guards,
    super.initial,
    super.path,
    super.maintainState,
    super.opaque,
  }) : super(
         transitionsBuilder: TransitionsBuilders.slideTop,
         duration: const Duration(milliseconds: 200),
       );

  TransitionRoute.slideBottom({
    required super.page,
    super.fullscreenDialog,
    super.children,
    super.guards,
    super.initial,
    super.path,
    super.maintainState,
    super.opaque,
  }) : super(
         transitionsBuilder:
             (
               BuildContext context,
               Animation<double> animation,
               Animation<double> secondaryAnimation,
               Widget child,
             ) {
               return SlideTransition(
                 transformHitTests: false,
                 position: Tween<Offset>(
                   begin: const Offset(0.0, 1.0),
                   end: Offset.zero,
                 ).animate(animation),
                 child: child,
               );
             },
         duration: const Duration(milliseconds: 200),
       );
}
