import 'package:flutter/material.dart';
import 'package:ventura_hr/shared/widgets/custom-text/custom-text.widget.dart';

class CandidacyDetailsEnterprisePage extends StatefulWidget {
  const CandidacyDetailsEnterprisePage({Key? key}) : super(key: key);

  @override
  State<CandidacyDetailsEnterprisePage> createState() => _CandidacyDetailsEnterprisePageState();
}

class _CandidacyDetailsEnterprisePageState extends State<CandidacyDetailsEnterprisePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
