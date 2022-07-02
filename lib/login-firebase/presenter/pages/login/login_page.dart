import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/shared/services/modular.service.dart';
import 'package:ventura_hr/shared/theme/colors.dart';
import 'package:ventura_hr/shared/widgets/buttons/button-types.dart';
import 'package:ventura_hr/shared/widgets/buttons/button.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final ModularService modularService;

  const LoginPage({Key? key, required this.modularService}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ClienteModel clientePF = ClienteModel(
    //   apelido: 'Cliente Teste 1',
    //   idEmpresa: 'n7a6clMs4EfuJ5Murtt3',
    //   clienteId: '',
    //   pessoaFisica: PessoaFisicaModel(
    //     cep: '111111111',
    //     nome: 'Nome Cliente Físico 1',
    //     cpf: '11111111111',
    //     rg: '111111111',
    //     enderecoComplemento: 'Endereco Teste 1',
    //     email: 'pf1@email.com',
    //     telefone: '21999999999',
    //   ),
    //   pessoaJuridica: null,
    // );
    // FirebaseFirestore.instance.collection('clientes').add(clientePF.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    // child: Image.asset("assets/medy-logo.png"),
                    ),
                SizedBox(
                  height: 40,
                ),
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
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                      child: Observer(
                        builder: (_) {
                          return Button(
                            onPressed: () {
                              controller.isValid ? controller.enterEmail() : () {};
                            },
                            type: ButtonTypes.primaryButton,
                            text: 'Entrar',
                            isDisabled: !store.isValid,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    widget.modularService.pushNamed('/cadastro');
                  },
                  child: Text(
                    'Não possui uma conta? Cadastre-se!',
                    style: TextStyle(color: ColorsTheme.support300, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
