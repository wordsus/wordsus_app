import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:wordsus_app/src/screens/routes.dart';

/// Login Screen
class LoginScreen extends StatelessWidget {
  /// Login Screen
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          // Navigator.pushReplacementNamed(context, '/profile');
          context.go(DashboardRoutes.route.path);
        }),
      ],
      // showAuthActionSwitch: false,
      // subtitleBuilder: (context, action) {
      //   return Padding(
      //     padding: const EdgeInsets.only(bottom: 8),
      //     child: Text(
      //       action == AuthAction.signIn
      //           ? 'Welcome to FlutterFire UI! Please sign in to continue.'
      //           : 'Welcome to FlutterFire UI! '
      //               'Please create an account to continue',
      //     ),
      //   );
      // },
      // footerBuilder: (context, _) {
      //   return const Padding(
      //     padding: EdgeInsets.only(top: 16),
      //     child: Text(
      //       'By signing in, you agree to our terms and conditions.',
      //       style: TextStyle(color: Colors.grey),
      //     ),
      //   );
      // },
      // headerBuilder: (context, constraints, _) {
      //   return Padding(
      //     padding: const EdgeInsets.all(20),
      //     child: AspectRatio(
      //       aspectRatio: 1,
      //       child: Image.asset(
      //         'assets/images/flutterfire_300x.png',
      //       ),
      //     ),
      //   );
      // },
      // sideBuilder: (context, constraints) {
      //   return Padding(
      //     padding: const EdgeInsets.all(20),
      //     child: AspectRatio(
      //       aspectRatio: 1,
      //       child: Image.asset(
      //         'assets/images/flutterfire_300x.png',
      //       ),
      //     ),
      //   );
      // },
    );
  }
}
