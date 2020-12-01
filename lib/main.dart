import 'package:flutter/material.dart';
// import 'package:math_expressions/math_expressions.dart';
import 'Calculadora/Calculadora.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
       home: new MyCustomForm(),
    );
  }
}