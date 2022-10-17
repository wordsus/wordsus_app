import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordsus_app/src/screens/routes.dart';

/// Root Screen
class DashboardScreen extends StatelessWidget {
  /// Root Screen
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Home'),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // Isn't necessary to check 'mounted' in StatelessWidget
              // ignore: use_build_context_synchronously
              context.go(LoginRoutes.route.path);
            },
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }
}
