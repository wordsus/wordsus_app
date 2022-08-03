import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:wordsus_app/screens/login/login_screen.dart';

/// Login screen location
class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/login'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('login'),
          title: 'Login',
          child: LoginScreen(),
        ),
      ];
}
