import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:validacion_formularios/src/blocs/validators.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar datos del String
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //Insertar valores al String
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el último valor ingresado a los streams
  String get email =>
      _emailController.hasValue ? _emailController.value : 'null';
  String get password =>
      _passwordController.hasValue ? _passwordController.value : 'null';

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
