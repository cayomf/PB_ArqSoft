import 'package:dio/dio.dart';
import 'package:ventura_hr/area-logada/domain/repositories/vacancy.repository.dart';
import 'package:ventura_hr/area-logada/external/models/vacancy/vacancy.model.dart';
import 'package:ventura_hr/shared/endpoints/endpoint.config.dart';
import 'package:ventura_hr/shared/helper/error-result.helper.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';
import 'package:ventura_hr/shared/services/dio.service.dart';

class VacancyRepositoryImpl implements VacancyRepository {
  final DioService dio;

  VacancyRepositoryImpl(this.dio);

  @override
  Future<Result<void>> create({required VacancyModel vacancy}) async {
    final url = Endpoints.vacancy.create.buildUrl();
    try {
      await dio.post(url, vacancy.toJson());
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    return const SuccessResult(null);
  }

  @override
  Future<Result<VacancyModel>> getById({required String id}) async {
    final url = Endpoints.admin.getById.buildUrl();
    Response<Map<String, dynamic>> response;

    try {
      response = await dio.post(url, {"id": id});
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    var admin = VacancyModel.fromJson(response.data!);
    return SuccessResult(admin);
  }

  @override
  Future<Result<List<VacancyModel>>> getAll() async {
    final url = Endpoints.vacancy.getAll.buildUrl();
    Response<List<dynamic>> response;
    try {
      response = await dio.get(url);
    } on DioError catch (error) {
      return ErrorResult.fromErrorResponse(error.response);
    }

    final vacancies = response.data!.map((e) => VacancyModel.fromJson(e as Map<String, dynamic>)).toList();

    return SuccessResult(vacancies);
  }
}
