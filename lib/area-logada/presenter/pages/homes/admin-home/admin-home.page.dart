import 'package:flutter/material.dart';
import 'package:ventura_hr/shared/widgets/buttons/button-types.dart';
import 'package:ventura_hr/shared/widgets/buttons/button.dart';
import 'package:ventura_hr/shared/widgets/custom-text/custom-text.widget.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomText(type: CustomTexts.h2Bold, text: "Olá, Fulaninho"),
              SizedBox(height: 20),
              Button(text: 'Perfil', onPressed: () {}, type: ButtonTypes.primaryButton, isDisabled: false),
              SizedBox(height: 20),
              Button(text: 'Candidaturas', onPressed: () {}, type: ButtonTypes.primaryButton, isDisabled: false),
              SizedBox(height: 20),
              CustomText(type: CustomTexts.h3Regular, text: "Vagas Disponíveis"),
              SizedBox(height: 10),
              ListView.builder(
                itemBuilder: (context, index) {
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textBuilder(String text, Function onChanged, String labelText) {
    return Column(
      children: [
        CustomText(
          type: CustomTexts.h2Bold,
          text: text,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomText(
          type: CustomTexts.h3Regular,
          text: text,
        ),
      ],
    );
  }
}
