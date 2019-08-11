import 'package:flutter/material.dart';
import 'screens/login_screen.dart' as login_screen;

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log me in',
      home: Scaffold(
        body: login_screen.LoginScreen(),
      ),
    );
  }
}
