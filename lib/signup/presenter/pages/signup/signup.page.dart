import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/shared/services/dio.service.dart';
import 'package:ventura_hr/shared/services/modular.service.dart';
import 'package:ventura_hr/shared/widgets/buttons/button-types.dart';
import 'package:ventura_hr/shared/widgets/buttons/button.dart';
import 'package:ventura_hr/shared/widgets/custom-text/custom-text.widget.dart';
import 'package:ventura_hr/shared/widgets/input-radio/input-radio.widget.dart';
import 'package:ventura_hr/signup/presenter/pages/signup/signup.controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  final DioService dioService;
  final ModularService modularService;

  const SignupPage({
    Key? key,
    required this.dioService,
    required this.modularService,
  }) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  bool hasSelectedType = false;
  bool hasText = false;

  bool hasNome = false;
  bool hasTelefone = false;
  bool hasEndereco = false;
  bool hasDocumento = false;

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
                const Center(
                    // child: Image.asset("assets/medy-logo.png"),
                    ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(height: 16),
                getRadioItem(
                    conta: TipoConta.candidato,
                    label: 'Candidato',
                    tipoConta: controller.tipoConta,
                    key: const Key('candidatoRadio')),
                const SizedBox(height: 8),
                getRadioItem(
                    conta: TipoConta.empresa,
                    label: 'Empresa',
                    tipoConta: controller.tipoConta,
                    key: const Key('empresaRadio')),
                const SizedBox(height: 24),
                buildSignupForm(),
                textFieldBuilder('Qual senha deseja para sua conta?', (value) {
                  setState(() {
                    controller.password = value;
                  });
                }, 'Senha'),
                const SizedBox(height: 24),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                      child: Observer(
                        builder: (value) {
                          return Button(
                            onPressed: () => {
                              if (controller.isCredentialsValid &&
                                  hasNome &&
                                  hasEndereco &&
                                  hasTelefone &&
                                  hasDocumento)
                                {controller.signup()}
                            }, //controller.isValid ? controller.signup : () {},
                            type: ButtonTypes.primaryButton,
                            text: 'Cadastrar',
                            isDisabled: !(controller.isCredentialsValid &&
                                hasNome &&
                                hasEndereco &&
                                hasTelefone &&
                                hasDocumento),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignupForm() {
    switch (controller.tipoConta) {
      case TipoConta.candidato:
        return buildCandidateSignup;
      case TipoConta.empresa:
        return buildEnterpriseSignup;
      default:
        return Container();
    }
  }

  Widget get buildEnterpriseSignup {
    return Center(
      child: Column(
        children: [
          textFieldBuilder('Qual é o nome da sua empresa?', (value) {
            if (value != "") {
              setState(() {
                hasNome = true;
              });
            } else {
              setState(() {
                hasNome = false;
              });
            }
            controller.updateEnterprise(nome: value);
          }, 'Nome'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o endereço de sua empresa?', (value) {
            if (value != "") {
              setState(() {
                hasEndereco = true;
              });
            } else {
              setState(() {
                hasEndereco = false;
              });
            }
            controller.updateEnterprise(endereco: value);
          }, 'Endereço'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o telefone da sua empresa?', (value) {
            if (value != "") {
              setState(() {
                hasTelefone = true;
              });
            } else {
              setState(() {
                hasTelefone = false;
              });
            }
            controller.updateEnterprise(telefone: value);
          }, 'Telefone'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o CNPJ da sua empresa?', (value) {
            if (value != "") {
              setState(() {
                hasDocumento = true;
              });
            } else {
              setState(() {
                hasDocumento = false;
              });
            }
            controller.updateEnterprise(cnpj: value);
          }, 'CNPJ'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o email da sua empresa?', (value) {
            controller.email = value;
            controller.updateEnterprise(email: value);
          }, 'Email'),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget get buildCandidateSignup {
    return Center(
      child: Column(
        children: [
          textFieldBuilder('Qual é o seu nome?', (value) {
            if (value != "") {
              setState(() {
                hasNome = true;
              });
            } else {
              setState(() {
                hasNome = false;
              });
            }
            controller.updateCandidate(nome: value);
          }, 'Nome'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o seu endereço?', (value) {
            if (value != "") {
              setState(() {
                hasEndereco = true;
              });
            } else {
              setState(() {
                hasEndereco = false;
              });
            }
            controller.updateCandidate(endereco: value);
          }, 'Complemento'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o seu telefone?', (value) {
            if (value != "") {
              setState(() {
                hasTelefone = true;
              });
            } else {
              setState(() {
                hasTelefone = false;
              });
            }
            controller.updateCandidate(telefone: value);
          }, 'Telefone'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o seu CPF?', (value) {
            if (value != "") {
              setState(() {
                hasDocumento = true;
              });
            } else {
              setState(() {
                hasDocumento = false;
              });
            }
            controller.updateCandidate(cpf: value);
          }, 'CPF'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o seu email?', (value) {
            controller.email = value;
            controller.updateCandidate(email: value);
          }, 'Email'),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget textFieldBuilder(String text, Function(String) onChanged, String labelText) {
    return Column(
      children: [
        Text(text),
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
      ],
    );
  }

  Widget getRadioItem(
      {required TipoConta conta, required String label, required TipoConta? tipoConta, required Key key}) {
    return Row(
      children: [
        InputRadio<TipoConta>(
          key: key,
          onChanged: (tipoSelecionado) {
            controller.tipoConta = tipoSelecionado;
            setState(() {
              hasSelectedType = true;
            });
          },
          disabled: false,
          groupValue: tipoConta,
          value: conta,
        ),
        const SizedBox(width: 14),
        CustomText(
          text: label,
          type: CustomTexts.paragraphRegular16,
        )
      ],
    );
  }

  signupUser() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: controller.email, password: controller.password);
    if (controller.tipoConta == TipoConta.candidato) {
      //widget.dioService.post('http://192.168.1.72:8080/user/createUser', resposta.toJson());
    } else if (controller.tipoConta == TipoConta.empresa) {}
    Modular.to.pushNamed('candidato-home');
  }
}
