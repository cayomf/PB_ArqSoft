import 'package:dio/dio.dart';
import 'package:ventura_hr/area-logada/external/models/admin/admin.model.dart';
import 'package:ventura_hr/area-logada/external/models/candidate/candidate.model.dart';
import 'package:ventura_hr/area-logada/external/models/enterprise/enterprise.model.dart';
import 'package:ventura_hr/shared/endpoints/endpoint.config.dart';
import 'package:ventura_hr/shared/helper/error-result.helper.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';
import 'package:ventura_hr/shared/services/dio.service.dart';
import 'package:ventura_hr/signup/domain/repositories/user.repository.dart';
import 'package:ventura_hr/signup/external/models/user.model.dart';

class UserRepositoryImpl implements UserRepository {
  final DioService dio;

  UserRepositoryImpl(this.dio);

  @override
  Future<Result<void>> create({required var user}) async {
    final url = Endpoints.user.create.buildUrl();
    try {
      await dio.post(url, user.toJson());
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    return const SuccessResult(null);
  }

  @override
  Future<Result<dynamic>> findByEmail({required String email}) async {
    final url = Endpoints.user.findByEmail.buildUrl();
    Response<Map<String, dynamic>> response;

    try {
      response = await dio.get(url + "?email=" + email);
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    var userModelObj;

    if (response.data!.containsKey("cpf")) {
      userModelObj = CandidateModel.fromJson(response.data!);
    } else if (response.data!.containsKey("cnpj")) {
      userModelObj = EnterpriseModel.fromJson(response.data!);
    } else {
      userModelObj = AdminModel.fromJson(response.data!);
    }

    return SuccessResult(userModelObj);
  }

  @override
  Future<Result<List<UserModel>>> getAll() async {
    final url = Endpoints.user.getAll.buildUrl();
    Response<List<dynamic>> response;
    try {
      response = await dio.get(url);
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    final users = response.data!.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();

    return SuccessResult(users);

    // final url = Endpoints.user.getAll.buildUrl();

    // try {
    //   await dio.get(url);
    // } on DioError catch (error) {
    //   return ErrorResult.fromErrorResponse(error.response);
    // }

    // return const SuccessResult(null);
  }
}
