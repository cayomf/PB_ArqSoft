import 'package:ventura_hr/area-logada/domain/entities/enterprise.entity.dart';
import 'package:ventura_hr/area-logada/domain/repositories/enterprise.repository.dart';
import 'package:ventura_hr/area-logada/domain/usecases/enterprise/enterprise.usecase.dart';
import 'package:ventura_hr/area-logada/external/models/enterprise/enterprise.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';

class EnterpriseUsecaseImpl implements EnterpriseUsecase {
  final EnterpriseRepository repository;

  EnterpriseUsecaseImpl(this.repository);

  @override
  Future<Result<void>> create({required Enterprise enterprise}) async {
    EnterpriseModel enterpriseModelObj = EnterpriseModel(
      cnpj: enterprise.cnpj,
      nome: enterprise.nome,
      email: enterprise.email,
      telefone: enterprise.telefone,
      status: enterprise.status,
      endereco: enterprise.endereco,
    );

    return await repository.create(enterprise: enterpriseModelObj);
  }

  @override
  Future<Result<void>> edit({required Enterprise enterprise}) async {
    EnterpriseModel enterpriseModelObj = EnterpriseModel(
      cnpj: enterprise.cnpj,
      nome: enterprise.nome,
      email: enterprise.email,
      telefone: enterprise.telefone,
      status: enterprise.status,
      endereco: enterprise.endereco,
    );

    return await repository.edit(enterprise: enterpriseModelObj);
  }

  @override
  Future<Result<void>> delete({required String id}) async {
    return await repository.delete(id: id);
  }

  @override
  Future<Result<Enterprise>> getById({required String id}) async {
    var result = await repository.getById(id: id);
    if (result.isSuccess()) {
      Enterprise enterprise = Enterprise(
        nome: result.getSuccessData().nome,
        email: result.getSuccessData().email,
        telefone: result.getSuccessData().telefone,
        cnpj: result.getSuccessData().cnpj,
        status: result.getSuccessData().status,
        endereco: result.getSuccessData().endereco,
      );

      return SuccessResult(enterprise);
    } else {
      return result.convertErrorResult();
    }
  }

  @override
  Future<Result<List<Enterprise>>> getAll() async {
    var result = await repository.getAll();
    List<Enterprise> enterprises = [];

    if (result.isSuccess()) {
      result.getSuccessData().map(
            (admin) => enterprises.add(
              Enterprise(
                status: admin.status,
                endereco: admin.endereco,
                nome: admin.nome,
                email: admin.email,
                telefone: admin.telefone,
                cnpj: admin.cnpj,
              ),
            ),
          );

      return SuccessResult(enterprises);
    } else {
      return result.convertErrorResult();
    }
  }
}
