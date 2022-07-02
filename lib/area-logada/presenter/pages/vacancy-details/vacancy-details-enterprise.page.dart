import 'package:flutter/material.dart';
import 'package:ventura_hr/shared/widgets/custom-text/custom-text.widget.dart';

class VacancyDetailsEnterprisePage extends StatefulWidget {
  const VacancyDetailsEnterprisePage({Key? key}) : super(key: key);

  @override
  State<VacancyDetailsEnterprisePage> createState() => _VacancyDetailsEnterprisePageState();
}

class _VacancyDetailsEnterprisePageState extends State<VacancyDetailsEnterprisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [],
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
