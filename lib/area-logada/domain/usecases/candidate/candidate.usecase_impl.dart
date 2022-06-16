import 'package:ventura_hr/area-logada/domain/entities/candidate.entity.dart';
import 'package:ventura_hr/area-logada/domain/repositories/candidate.repository.dart';
import 'package:ventura_hr/area-logada/domain/usecases/candidate/candidate.usecase.dart';
import 'package:ventura_hr/area-logada/external/models/candidate/candidate.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';

class CandidateUsecaseImpl implements CandidateUsecase {
  final CandidateRepository repository;

  CandidateUsecaseImpl(this.repository);

  @override
  Future<Result<void>> create({required Candidate candidate}) async {
    CandidateModel candidateModelObj = CandidateModel(
      cep: candidate.cep,
      complemento: candidate.complemento,
      cpf: candidate.cpf,
      nome: candidate.nome,
      email: candidate.email,
      telefone: candidate.telefone,
    );

    return await repository.create(candidate: candidateModelObj);
  }

  @override
  Future<Result<void>> edit({required Candidate candidate}) async {
    CandidateModel candidateModelObj = CandidateModel(
      cep: candidate.cep,
      complemento: candidate.complemento,
      cpf: candidate.cpf,
      nome: candidate.nome,
      email: candidate.email,
      telefone: candidate.telefone,
    );

    return await repository.edit(candidate: candidateModelObj);
  }

  @override
  Future<Result<void>> delete({required String id}) async {
    return await repository.delete(id: id);
  }

  @override
  Future<Result<Candidate>> getById({required String id}) async {
    var result = await repository.getById(id: id);
    if (result.isSuccess()) {
      Candidate candidate = Candidate(
        nome: result.getSuccessData().nome,
        email: result.getSuccessData().email,
        telefone: result.getSuccessData().telefone,
        cpf: result.getSuccessData().cpf,
        cep: result.getSuccessData().cep,
        complemento: result.getSuccessData().complemento,
      );

      return SuccessResult(candidate);
    } else {
      return result.convertErrorResult();
    }
  }

  @override
  Future<Result<List<Candidate>>> getAll() async {
    var result = await repository.getAll();
    List<Candidate> candidates = [];

    if (result.isSuccess()) {
      result.getSuccessData().map(
            (candidate) => candidates.add(
              Candidate(
                cep: candidate.cep,
                complemento: candidate.complemento,
                nome: candidate.nome,
                email: candidate.email,
                telefone: candidate.telefone,
                cpf: candidate.cpf,
              ),
            ),
          );

      return SuccessResult(candidates);
    } else {
      return result.convertErrorResult();
    }
  }
}
