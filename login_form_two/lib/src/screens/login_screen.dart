import 'package:flutter/material.dart';
import '../blocs/bloc.dart' as b;
import '../blocs/provider.dart' as p;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = p.Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          this.emailField(bloc),
          this.passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 20.0)),
          this.submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(b.Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@email.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(b.Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          obscureText: true,
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(b.Bloc bloc) {
    return RaisedButton(
      child: Text('Login'),
      color: Colors.yellow,
      onPressed: () => print('Press'),
    );
  }
}
