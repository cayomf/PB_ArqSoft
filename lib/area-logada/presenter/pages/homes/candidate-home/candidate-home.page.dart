import 'package:flutter/material.dart';
import 'package:ventura_hr/area-logada/domain/entities/vacancy.entity.dart';
import 'package:ventura_hr/area-logada/domain/usecases/vacancy/vacancy.usecase.dart';
import 'package:ventura_hr/shared/helper/formatter.helper.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/stores/auth_store.dart';
import 'package:ventura_hr/shared/widgets/buttons/button-types.dart';
import 'package:ventura_hr/shared/widgets/buttons/button.dart';
import 'package:ventura_hr/shared/widgets/custom-text/custom-text.widget.dart';
import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

class CandidateHomePage extends StatefulWidget {
  final AuthStore authStore;
  final VacancyUsecase vacancyUsecase;

  const CandidateHomePage({Key? key, required this.authStore, required this.vacancyUsecase}) : super(key: key);

  @override
  State<CandidateHomePage> createState() => _CandidateHomePageState();
}

class _CandidateHomePageState extends State<CandidateHomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getListaVagas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : Column(
                    children: [
                      CustomText(type: CustomTexts.h2Bold, text: "Olá, " + (widget.authStore.userData as User).nome),
                      SizedBox(height: 20),
                      Button(text: 'Perfil', onPressed: () {}, type: ButtonTypes.primaryButton, isDisabled: false),
                      SizedBox(height: 20),
                      Button(
                          text: 'Candidaturas', onPressed: () {}, type: ButtonTypes.primaryButton, isDisabled: false),
                      SizedBox(height: 20),
                      CustomText(type: CustomTexts.h3Regular, text: "Vagas Disponíveis"),
                      SizedBox(height: 10),
                      Column(
                        children: getListaWidgetVagas,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget cardVaga(Vacancy vacancy) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Row(
          children: [
            Column(
              children: [
                CustomText(
                  text: "Teste",
                  type: CustomTexts.h2Bold,
                ),
                CustomText(
                  text: "Teste",
                  type: CustomTexts.h3Regular,
                )
              ],
            ),
            CustomText(
              text: Formatter.currency(1000),
              type: CustomTexts.h1Bold,
            )
          ],
        ),
      ),
    );
  }

  getListaVagas() async {
    Result<List<Vacancy>> result = await widget.vacancyUsecase.getAll();
    if (result.isSuccess()) {
      widget.authStore.listaVagas = result.getSuccessData();
    }
    setState(() {
      isLoading = false;
    });
  }

  List<Widget> get getListaWidgetVagas {
    List<Widget> widgets = [];

    for (Vacancy vaga in widget.authStore.listaVagas) {
      widgets.add(cardVaga(vaga));
    }

    return widgets;
  }
}
