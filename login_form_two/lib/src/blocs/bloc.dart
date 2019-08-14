import 'dart:async';
import 'validators.dart' as validators;
import 'package:rxdart/rxdart.dart' as rx;

class Bloc extends Object with validators.Validator {
  // the de defaul behaviours for ScreamController is single listener
  // if we want broadcast the stream we have to instantiate with StreamController<T>.broadcast()
  // ============================================
  // final StreamController<String> _emailController = StreamController<String>.broadcast();
  // final StreamController<String> _passwordController = StreamController<String>.broadcast();

  // or
  // we can use rxDart's BehaviorSubject
  // ============================================

  // ignore close_sinks, we have add close at dispose
  final rx.BehaviorSubject<String> _emailController = rx.BehaviorSubject<String>(); // ignore: close_sinks
  final rx.BehaviorSubject<String> _passwordController = rx.BehaviorSubject<String>(); // ignore: close_sinks

  Stream<String> get email =>
      this._emailController.stream.transform(validateEmail);

  Stream<String> get password =>
      this._passwordController.stream.transform(validatePassword);

  Stream<bool> get isSubmitValid => rx.Observable.combineLatest2(
      this.email, this.password, (String e, String p) => true);

  Function(String) get changeEmail => this._emailController.sink.add;

  Function(String) get changePassword => this._passwordController.sink.add;

  void submitLogin() {
    final String validEmail = this._emailController.value;
    final String validPassword = this._passwordController.value;

    print('{validEmail: $validEmail, validPassword: $validPassword}');
  }

  void dispose() {
    // As we use rxDart, we no need to call close directly
    // we call BehaviorSubject's close
    // no change's at code. But we have to note that
    // the close is from BehaviorSubjetc<T>'s close
    // not from StreamController<T>' close

    this._emailController.close();
    this._passwordController.close();

  }
}
