import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/shared/services/modular.service.dart';

import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final ModularService modularService;

  const RegisterPage({Key? key, required this.modularService}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: controller.setEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: controller.setPassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Modular.to.pushNamed("/phone");
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Phone Login",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (_) {
                return ElevatedButton(
                  onPressed: () {
                    controller.isValid ? controller.enterEmail : null;
                  },
                  child: Text("Cadastrar!"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
