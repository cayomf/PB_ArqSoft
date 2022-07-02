import 'package:ventura_hr/area-logada/domain/entities/admin.entity.dart';
import 'package:ventura_hr/area-logada/domain/repositories/admin.repository.dart';
import 'package:ventura_hr/area-logada/domain/usecases/admin/admin.usecase.dart';
import 'package:ventura_hr/area-logada/external/models/admin/admin.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';

class AdminUsecaseImpl implements AdminUsecase {
  final AdminRepository repository;

  AdminUsecaseImpl(this.repository);

  @override
  Future<Result<void>> create({required Admin admin}) async {
    AdminModel adminModelObj = AdminModel(
      status: admin.status,
      endereco: admin.endereco,
      nome: admin.nome,
      email: admin.email,
      telefone: admin.telefone,
      adminId: admin.adminId,
    );

    return await repository.create(admin: adminModelObj);
  }

  @override
  Future<Result<void>> edit({required Admin admin}) async {
    AdminModel adminModelObj = AdminModel(
      status: admin.status,
      endereco: admin.endereco,
      nome: admin.nome,
      email: admin.email,
      telefone: admin.telefone,
      adminId: admin.adminId,
    );

    return await repository.create(admin: adminModelObj);
  }

  @override
  Future<Result<Admin>> getById({required String id}) async {
    var result = await repository.getById(id: id);
    if (result.isSuccess()) {
      Admin admin = Admin(
        nome: result.getSuccessData().nome,
        email: result.getSuccessData().email,
        telefone: result.getSuccessData().telefone,
        adminId: result.getSuccessData().adminId,
        status: result.getSuccessData().status,
        endereco: result.getSuccessData().endereco,
      );

      return SuccessResult(admin);
    } else {
      return result.convertErrorResult();
    }
  }

  @override
  Future<Result<List<Admin>>> getAll() async {
    var result = await repository.getAll();
    List<Admin> admins = [];

    if (result.isSuccess()) {
      result.getSuccessData().map((admin) => admins.add(Admin(
            status: admin.status,
            endereco: admin.endereco,
            nome: admin.nome,
            email: admin.email,
            telefone: admin.telefone,
            adminId: admin.adminId,
          )));

      return SuccessResult(admins);
    } else {
      return result.convertErrorResult();
    }
  }
}
