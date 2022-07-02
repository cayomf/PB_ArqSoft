import 'package:ventura_hr/area-logada/domain/entities/admin.entity.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class AdminUsecase {
  Future<Result<Admin>> getById({required String id});
  // pegar quantidade de usuários
  // pegar quantidade de usuários ativos
  // pegar quantidade de usuários inativos
  // pegar quantidade de vagas
  // pegar quantidade de vagas ativas
  // pegar quantidade de vagas inativas
}
