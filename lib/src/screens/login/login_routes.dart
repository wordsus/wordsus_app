import 'package:go_router/go_router.dart';
import 'package:wordsus_app/src/screens/login/login_screen.dart';

/// Login screen routes
class LoginRoutes {
  /// GoRoute config for Login screen
  static final route = GoRoute(
    path: '/login',
    pageBuilder: (context, state) => NoTransitionPage(
      key: state.pageKey,
      child: const LoginScreen(),
    ),
  );
}
