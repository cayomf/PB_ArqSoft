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

    vacancy.criterios.map(
      (criterio) => criterios.add(
        CriterionModel(
          id: criterio.id,
          descricao: criterio.descricao,
          peso: criterio.peso,
        ),
      ),
    );
    VacancyModel vacancyModelObj = VacancyModel(
      id: vacancy.id!,
      cargo: vacancy.cargo,
      salario: vacancy.salario,
      endereco: vacancy.endereco,
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

    vacancy.criterios.map(
      (criterio) => criterios.add(
        CriterionModel(
          id: criterio.id,
          descricao: criterio.descricao,
          peso: criterio.peso,
        ),
      ),
    );
    VacancyModel vacancyModelObj = VacancyModel(
      id: vacancy.id,
      cargo: vacancy.cargo,
      salario: vacancy.salario,
      endereco: vacancy.endereco,
      dataCriacao: vacancy.dataCriacao,
      criterios: criterios,
      empresaId: vacancy.empresaId,
      status: vacancy.status,
    );

    return await repository.create(vacancy: vacancyModelObj);
  }

  @override
  Future<Result<Vacancy>> getById({required String id}) async {
    var result = await repository.getById(id: id);
    List<Criterion> criteria = [];

    if (result.isSuccess()) {
      criteria.map(
        (criterion) => criteria.add(
          Criterion(id: criterion.id, descricao: criterion.descricao, peso: criterion.peso),
        ),
      );
      Vacancy candidacy = Vacancy(
        id: result.getSuccessData().id,
        criterios: criteria,
        cargo: result.getSuccessData().cargo,
        salario: result.getSuccessData().salario,
        endereco: result.getSuccessData().endereco,
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
              id: criterio.id,
            )));
        vacancies.add(
          Vacancy(
            id: vacancy.id,
            cargo: vacancy.cargo,
            salario: vacancy.salario,
            endereco: vacancy.endereco,
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
