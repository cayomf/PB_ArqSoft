import 'package:ventura_hr/area-logada/domain/entities/admin.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/candidate.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/enterprise.entity.dart';
import 'package:ventura_hr/area-logada/external/models/admin/admin.model.dart';
import 'package:ventura_hr/area-logada/external/models/candidate/candidate.model.dart';
import 'package:ventura_hr/area-logada/external/models/enterprise/enterprise.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';
import 'package:ventura_hr/signup/domain/entities/user.entity.dart';
import 'package:ventura_hr/signup/domain/repositories/user.repository.dart';
import 'package:ventura_hr/signup/domain/usecases/user.usecase.dart';
import 'package:ventura_hr/signup/external/models/user.model.dart';

class UserUsecaseImpl implements UserUsecase {
  final UserRepository repository;

  UserUsecaseImpl(this.repository);

  @override
  Future<Result<void>> create({required var user}) async {
    var userModelObj;

    if (user is Candidate) {
      userModelObj = CandidateModel(
        status: user.status,
        endereco: user.endereco,
        nome: user.nome,
        email: user.email,
        telefone: user.telefone,
        id: user.id,
        accountType: 1,
        cpf: (user as Candidate).cpf,
      );
    } else if (user is Enterprise) {
      userModelObj = EnterpriseModel(
        status: user.status,
        endereco: user.endereco,
        nome: user.nome,
        email: user.email,
        telefone: user.telefone,
        id: user.id,
        accountType: 2,
        cnpj: (user as Enterprise).cnpj,
      );
    } else {
      userModelObj = AdminModel(
        status: user.status,
        endereco: user.endereco,
        nome: user.nome,
        email: user.email,
        telefone: user.telefone,
        id: user.id,
        accountType: 2,
        adminId: "",
      );
    }

    return await repository.create(user: userModelObj);
  }

  @override
  Future<Result<List<User>>> getAll() async {
    var result = await repository.getAll();
    List<User> users = [];

    if (result.isSuccess()) {
      result.getSuccessData().map((user) => users.add(User(
            status: user.status,
            endereco: user.endereco,
            nome: user.nome,
            email: user.email,
            telefone: user.telefone,
            id: user.id,
            accountType: user.accountType,
          )));

      return SuccessResult(users);
    } else {
      return result.convertErrorResult();
    }
  }

  @override
  Future<Result<dynamic>> findByEmail({required String email}) async {
    var user;

    var result = await repository.findByEmail(email: email);

    if (result.isSuccess()) {
      var userModelObj = result.getSuccessData();

      if (userModelObj is CandidateModel) {
        user = Candidate(
          status: userModelObj.status,
          endereco: userModelObj.endereco,
          nome: userModelObj.nome,
          email: userModelObj.email,
          telefone: userModelObj.telefone,
          id: userModelObj.id,
          accountType: 1,
          cpf: (userModelObj as CandidateModel).cpf,
        );
      } else if (userModelObj is EnterpriseModel) {
        user = Enterprise(
          status: userModelObj.status,
          endereco: userModelObj.endereco,
          nome: userModelObj.nome,
          email: userModelObj.email,
          telefone: userModelObj.telefone,
          id: userModelObj.id,
          accountType: 2,
          cnpj: (userModelObj as EnterpriseModel).cnpj,
        );
      } else {
        user = Admin(
          status: userModelObj.status,
          endereco: userModelObj.endereco,
          nome: userModelObj.nome,
          email: userModelObj.email,
          telefone: userModelObj.telefone,
          id: userModelObj.id,
          accountType: 2,
          adminId: "",
        );
      }

      return SuccessResult(user);
    } else {
      return result.convertErrorResult();
    }
  }
}
