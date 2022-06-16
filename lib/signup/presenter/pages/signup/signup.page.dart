import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/shared/widgets/buttons/button-types.dart';
import 'package:ventura_hr/shared/widgets/buttons/button.dart';
import 'package:ventura_hr/shared/widgets/custom-text/custom-text.widget.dart';
import 'package:ventura_hr/shared/widgets/input-radio/input-radio.widget.dart';
import 'package:ventura_hr/signup/presenter/pages/signup/signup.controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> {
  bool hasSelectedType = false;
  bool hasText = false;

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
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                      child: Observer(
                        builder: (value) {
                          return Button(
                            onPressed: controller.isValid ? controller.signup : () {},
                            type: ButtonTypes.primaryButton,
                            text: 'Cadastrar',
                            isDisabled: !store.isValid,
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
          textFieldBuilder(
              'Qual é o nome da sua empresa?', (value) => controller.updateEnterprise(nome: value), 'Nome'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o CEP da sua empresa?', (value) => controller.updateEnterprise(cep: value), 'CEP'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o complemento do endereço de sua empresa?',
              (value) => controller.updateEnterprise(complemento: value), 'Complemento'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder(
              'Qual é o telefone da sua empresa?', (value) => controller.updateEnterprise(telefone: value), 'Telefone'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder(
              'Qual é o CNPJ da sua empresa?', (value) => controller.updateEnterprise(cnpj: value), 'CNPJ'),
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
          textFieldBuilder('Qual senha deseja para sua conta?', (value) => controller.password, 'Senha'),
        ],
      ),
    );
  }

  Widget get buildCandidateSignup {
    return Center(
      child: Column(
        children: [
          textFieldBuilder('Qual é o seu nome?', (value) => controller.updateCandidate(nome: value), 'Nome'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é seu o CEP?', (value) => controller.updateCandidate(cep: value), 'CEP'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o complemento do seu endereço?',
              (value) => controller.updateCandidate(complemento: value), 'Complemento'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder(
              'Qual é o seu telefone?', (value) => controller.updateCandidate(telefone: value), 'Telefone'),
          const SizedBox(
            height: 30,
          ),
          textFieldBuilder('Qual é o seu CPF?', (value) => controller.updateCandidate(cpf: value), 'CPF'),
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
          textFieldBuilder('Qual senha deseja para sua conta?', (value) => controller.password, 'Senha'),
        ],
      ),
    );
  }

  Widget textFieldBuilder(String text, Function onChanged, String labelText) {
    return Column(
      children: [
        const Text('Qual senha deseja para sua conta?'),
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (value) => controller.password,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Email",
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
}
