import 'package:flutter/material.dart';
import 'package:ventura_hr/shared/widgets/buttons/button-types.dart';
import 'package:ventura_hr/shared/widgets/buttons/button.dart';
import 'package:ventura_hr/shared/widgets/custom-text/custom-text.widget.dart';

class EnterpriseHomePage extends StatefulWidget {
  const EnterpriseHomePage({Key? key}) : super(key: key);

  @override
  State<EnterpriseHomePage> createState() => _EnterpriseHomePageState();
}

class _EnterpriseHomePageState extends State<EnterpriseHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomText(type: CustomTexts.h2Bold, text: "Empresa Genérica"),
              SizedBox(height: 20),
              Button(text: 'Perfil', onPressed: () {}, type: ButtonTypes.primaryButton, isDisabled: false),
              SizedBox(height: 20),
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
}
