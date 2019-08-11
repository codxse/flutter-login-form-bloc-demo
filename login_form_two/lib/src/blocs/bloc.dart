import 'dart:async';
import 'validators.dart' as validators;

class Bloc extends Object with validators.Validator {
  final StreamController<String> _emailController = StreamController<String>();
  final StreamController<String> _passwordController = StreamController<String>();

  Stream<String> get email => this._emailController.stream.transform(validateEmail);
  Stream<String> get password => this._passwordController.stream.transform(validatePassword);

  Function(String) get changeEmail => this._emailController.sink.add;
  Function(String) get changePassword => this._passwordController.sink.add;

  void dispose() {
    this._emailController.close();
    this._passwordController.close();
  }
}

final bloc = Bloc();