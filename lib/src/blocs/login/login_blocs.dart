import 'dart:async';
import 'package:retail_demo/src/ui/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlocs extends BaseBloc {
  final BehaviorSubject emailController = BehaviorSubject<String>();
  final BehaviorSubject passwordController = BehaviorSubject<String>();

  Function(String) get emailSink => emailController.sink.add;
  Function(String) get passwordSink => passwordController.sink.add;

  Stream get emailStream => emailController.stream;

  Stream<bool> submitStream;

  LoginBlocs() {}

  dispose() {
    emailController.close();
    passwordController.close();
  }
}
