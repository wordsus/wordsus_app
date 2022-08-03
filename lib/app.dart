import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wordsus_app/screens/dashboard/dashboard_location.dart';
import 'package:wordsus_app/screens/login/login_location.dart';

/// App Widget
class App extends StatefulWidget {
  /// App Widget
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        LoginLocation(),
        // SignUpLocation(),
        DashboardLocation(),
      ],
    ),
    guards: [
      // Check for private screens. All non auth screens.
      BeamGuard(
        // On which path patterns (from incoming routes) to perform the check
        pathPatterns: ['/login', '/signup'],
        // Perform the check on all patterns that **don't** have a match
        // in pathPatterns
        guardNonMatching: true,
        // Return false to redirect
        check: (_, __) => FirebaseAuth.instance.currentUser != null,
        // Where to redirect on a false check
        beamToNamed: (_, __) => LoginLocation().pathPatterns.first,
      ),
      // Check for public screens. All auth screens.
      BeamGuard(
        // On which path patterns (from incoming routes) to perform the check
        pathPatterns: ['/', '/login', '/signup'],
        // Return false to redirect
        check: (_, __) => FirebaseAuth.instance.currentUser == null,
        // Where to redirect on a false check
        beamToNamed: (_, __) => DashboardLocation().pathPatterns.first,
      ),
    ],
  );

  // Used to update Router Delegate on auth state changes
  late StreamSubscription<User?> _authStateSubscription;

  @override
  void initState() {
    // Update Router Delegate on auth state changes
    _authStateSubscription = FirebaseAuth.instance
        .authStateChanges()
        .listen((_) => _routerDelegate.update());

    super.initState();
  }

  @override
  void dispose() {
    // Cancel subscription
    _authStateSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: _routerDelegate,
      ),
    );
  }
}
