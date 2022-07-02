import 'package:ventura_hr/area-logada/domain/entities/criterion.entity.dart';
import 'package:ventura_hr/area-logada/domain/repositories/criterion.repository.dart';
import 'package:ventura_hr/area-logada/domain/usecases/criterion/criterion.usecase.dart';
import 'package:ventura_hr/area-logada/external/models/criterion/criterion.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';

class CriterionUsecaseImpl implements CriterionUsecase {
  final CriterionRepository repository;

  CriterionUsecaseImpl(this.repository);

  @override
  Future<Result<void>> create({required Criterion criterion}) async {
    CriterionModel criterionModelObj = CriterionModel(
      descricao: criterion.descricao,
      peso: criterion.peso,
      id: criterion.id,
    );

    return await repository.create(criterion: criterionModelObj);
  }

  @override
  Future<Result<void>> edit({required Criterion criterion}) async {
    CriterionModel criterionModelObj = CriterionModel(
      descricao: criterion.descricao,
      peso: criterion.peso,
      id: criterion.id,
    );

    return await repository.edit(criterion: criterionModelObj);
  }

  @override
  Future<Result<void>> delete({required String id}) async {
    return await repository.delete(id: id);
  }

  @override
  Future<Result<Criterion>> getById({required String id}) async {
    var result = await repository.getById(id: id);

    if (result.isSuccess()) {
      Criterion criterion = Criterion(
        descricao: result.getSuccessData().descricao,
        peso: result.getSuccessData().peso,
        id: result.getSuccessData().id,
      );

      return SuccessResult(criterion);
    } else {
      return result.convertErrorResult();
    }
  }

  @override
  Future<Result<List<Criterion>>> getAll() async {
    var result = await repository.getAll();
    List<Criterion> criteria = [];

    if (result.isSuccess()) {
      result.getSuccessData().map((criterion) {
        criteria.add(
          Criterion(
            descricao: criterion.descricao,
            peso: criterion.peso,
            id: criterion.id,
          ),
        );
      });

      return SuccessResult(criteria);
    } else {
      return result.convertErrorResult();
    }
  }
}
