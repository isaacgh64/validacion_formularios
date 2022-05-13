import 'package:flutter/material.dart';
import 'package:validacion_formularios/src/blocs/provider.dart';
import 'package:validacion_formularios/src/pages/home_page.dart';
import 'package:validacion_formularios/src/pages/login_page.dart';
import 'package:validacion_formularios/src/pages/producto_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'home': (BuildContext context) => const HomePage(),
        'producto': (BuildContext context) => ProductoPage(),
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
    ));
  }
}
