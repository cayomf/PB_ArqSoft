import 'package:dio/dio.dart';
import 'package:ventura_hr/area-logada/domain/repositories/admin.repository.dart';
import 'package:ventura_hr/area-logada/external/models/admin/admin.model.dart';
import 'package:ventura_hr/shared/endpoints/endpoint.config.dart';
import 'package:ventura_hr/shared/helper/error-result.helper.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';
import 'package:ventura_hr/shared/services/dio.service.dart';

class AdminRepositoryImpl implements AdminRepository {
  final DioService dio;

  AdminRepositoryImpl(this.dio);

  @override
  Future<Result<void>> create({required AdminModel admin}) async {
    final url = Endpoints.admin.create.buildUrl();
    try {
      await dio.post(url, {"admin": admin});
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    return const SuccessResult(null);
  }

  @override
  Future<Result<AdminModel>> getById({required String id}) async {
    final url = Endpoints.admin.getById.buildUrl();
    Response<Map<String, dynamic>> response;

    try {
      response = await dio.post(url, {"id": id});
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    var admin = AdminModel.fromJson(response.data!);
    return SuccessResult(admin);
  }

  @override
  Future<Result<List<AdminModel>>> getAll() async {
    final url = Endpoints.admin.getAll.buildUrl();
    Response<List<dynamic>> response;
    try {
      response = await dio.get(url);
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    final admins = response.data!.map((e) => AdminModel.fromJson(e as Map<String, dynamic>)).toList();

    return SuccessResult(admins);

    // final url = Endpoints.admin.getAll.buildUrl();

    // try {
    //   await dio.get(url);
    // } on DioError catch (error) {
    //   return ErrorResult.fromErrorResponse(error.response);
    // }

    // return const SuccessResult(null);
  }
}
