import 'package:ventura_hr/area-logada/domain/entities/criterion.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/vacancy.entity.dart';
import 'package:ventura_hr/area-logada/domain/repositories/vacancy.repository.dart';
import 'package:ventura_hr/area-logada/domain/usecases/vacancy/vacancy.usecase.dart';
import 'package:ventura_hr/area-logada/external/models/criterion/criterion.model.dart';
import 'package:ventura_hr/area-logada/external/models/vacancy/vacancy.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';

class VacancyUsecaseImpl implements VacancyUsecase {
  final VacancyRepository repository;

  VacancyUsecaseImpl(this.repository);

  @override
  Future<Result<void>> create({required Vacancy vacancy}) async {
    List<CriterionModel> criterios = [];

    vacancy.criterios.map((criterio) => criterios.add(CriterionModel(
        vagaId: criterio.vagaId, descricao: criterio.descricao, relevancia: criterio.relevancia, peso: criterio.peso)));
    VacancyModel vacancyModelObj = VacancyModel(
      cargo: vacancy.cargo,
      cep: vacancy.cep,
      complemento: vacancy.complemento,
      dataCriacao: vacancy.dataCriacao,
      criterios: criterios,
      empresaId: vacancy.empresaId,
      status: vacancy.status,
    );

    return await repository.create(vacancy: vacancyModelObj);
  }

  @override
  Future<Result<void>> edit({required Vacancy vacancy}) async {
    List<CriterionModel> criterios = [];

    vacancy.criterios.map((criterio) => criterios.add(CriterionModel(
        vagaId: criterio.vagaId, descricao: criterio.descricao, relevancia: criterio.relevancia, peso: criterio.peso)));
    VacancyModel vacancyModelObj = VacancyModel(
      cargo: vacancy.cargo,
      cep: vacancy.cep,
      complemento: vacancy.complemento,
      dataCriacao: vacancy.dataCriacao,
      criterios: criterios,
      empresaId: vacancy.empresaId,
      status: vacancy.status,
    );

    return await repository.create(vacancy: vacancyModelObj);
  }

  @override
  Future<Result<void>> delete({required String id}) async {
    return await repository.delete(id: id);
  }

  @override
  Future<Result<Vacancy>> getById({required String id}) async {
    var result = await repository.getById(id: id);
    List<Criterion> criteria = [];

    if (result.isSuccess()) {
      criteria.map(
        (criterion) => criteria.add(
          Criterion(
              vagaId: criterion.vagaId,
              descricao: criterion.descricao,
              relevancia: criterion.relevancia,
              peso: criterion.peso),
        ),
      );
      Vacancy candidacy = Vacancy(
        criterios: criteria,
        cargo: result.getSuccessData().cargo,
        cep: result.getSuccessData().cep,
        complemento: result.getSuccessData().complemento,
        dataCriacao: result.getSuccessData().dataCriacao,
        empresaId: result.getSuccessData().empresaId,
        status: result.getSuccessData().status,
      );

      return SuccessResult(candidacy);
    } else {
      return result.convertErrorResult();
    }
  }

  @override
  Future<Result<List<Vacancy>>> getAll() async {
    var result = await repository.getAll();
    List<Vacancy> vacancies = [];

    if (result.isSuccess()) {
      result.getSuccessData().map((vacancy) {
        List<Criterion> criterios = [];

        vacancy.criterios.map((criterio) => criterios.add(Criterion(
              descricao: criterio.descricao,
              peso: criterio.peso,
              relevancia: criterio.relevancia,
              vagaId: criterio.vagaId,
            )));
        vacancies.add(
          Vacancy(
            cargo: vacancy.cargo,
            cep: vacancy.cep,
            complemento: vacancy.complemento,
            criterios: criterios,
            dataCriacao: vacancy.dataCriacao,
            empresaId: vacancy.empresaId,
            status: vacancy.status,
          ),
        );
      });

      return SuccessResult(vacancies);
    } else {
      return result.convertErrorResult();
    }
  }
}
