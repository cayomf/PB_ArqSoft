import 'package:flutter/material.dart';

class CreateCandidacyPage extends StatefulWidget {
  const CreateCandidacyPage({Key? key}) : super(key: key);

  @override
  State<CreateCandidacyPage> createState() => _CreateCandidacyPageState();
}

class _CreateCandidacyPageState extends State<CreateCandidacyPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
