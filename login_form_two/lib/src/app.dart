import 'package:flutter/material.dart';
import 'screens/login_screen.dart' as login_screen;
import 'blocs/provider.dart' as prov;

class App extends StatelessWidget {
  @override
  prov.Provider build(BuildContext context) {
    return prov.Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Log me in',
        home: Scaffold(
          body: login_screen.LoginScreen(),
        ),
      ),
    );
  }
}
