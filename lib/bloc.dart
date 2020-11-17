import 'dart:async';
import 'package:bloc_login_page_app/validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators implements BaseBloc{

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // Input of the stream
  StreamSink<String> get emailChanged => _emailController.sink;
  StreamSink<String> get passwordChanged => _passwordController.sink;

  // Output of the stream
  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  // Function to handle the selection of the submit button
  Stream<bool> get submitCheck => Rx.combineLatest2(email, password, (e, p) => true);
  submit() {}

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}

abstract class BaseBloc{
  void dispose();
}