import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka show builder;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      initialRoute: '/',
      builder: asuka.builder,
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}
