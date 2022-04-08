import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/app.module.dart';
import 'package:ventura_hr/app.widget.dart';

//void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));

//void main() => runApp(MaterialApp(home: HomePage()));
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
