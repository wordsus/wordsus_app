import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

/// Dashboard Screen
class DashboardScreen extends StatelessWidget {
  /// Dashboard Screen
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      initialData: false,
      future: Future.delayed(const Duration(seconds: 1), () => true),
      builder: (context, snapshot) {
        if (snapshot.data!) {
          return const ProfileScreen(
            avatarSize: 24,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
