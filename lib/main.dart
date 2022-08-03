import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:wordsus_app/app.dart';
import 'package:wordsus_app/firebase_options.dart';
import 'package:wordsus_app/utils/auth/ensure_initialized_auth.dart';
import 'package:wordsus_app/utils/url_strategy/url_strategy.dart';

void main() async {
  // This method required for initializations before calling runApp.
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserve Native Splash during initializations
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Configure Firebase auth providers
  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
  ]);

  // For web: use URLs without '#' character
  usePathUrlStrategy();

  // Wait until receiving the first data from Firebase Auth
  await ensureInitializedAuth();

  // Remove Native Splash
  FlutterNativeSplash.remove();

  // Run the App
  runApp(const App());
}
