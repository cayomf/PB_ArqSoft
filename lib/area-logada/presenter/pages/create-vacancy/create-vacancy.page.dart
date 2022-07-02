import 'package:flutter/material.dart';

class CreateVacancyPage extends StatefulWidget {
  const CreateVacancyPage({Key? key}) : super(key: key);

  @override
  State<CreateVacancyPage> createState() => _CreateVacancyPageState();
}

class _CreateVacancyPageState extends State<CreateVacancyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            textFieldBuilder('Qual é o cargo ofertado?', (value) {}, 'Cargo'),
            const SizedBox(
              height: 30,
            ),
            textFieldBuilder('Qual é o endereço do local de trabalho?', (value) {}, 'Endereço'),
            const SizedBox(
              height: 30,
            ),
            textFieldBuilder('Qual é a estimativa salarial', (value) {}, 'Estimativa Salarial'),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
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
          onChanged: (fieldText) => onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
      ],
    );
  }
}
