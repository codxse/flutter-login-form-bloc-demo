import 'dart:async';

class Validator {
  final StreamTransformer<String, String> validateEmail =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String email, EventSink<String> sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid email');
    }
  });

  final StreamTransformer<String, String> validatePassword =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (String password, EventSink<String> sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError('Password length min 5 characters long!');
    }
  });
}
