import 'package:ventura_hr/shared/endpoints/endpoint.dart';

class CandidateController {
  final Endpoint create;
  final Endpoint edit;
  final Endpoint delete;
  final Endpoint getById;
  final Endpoint getAll;

  const CandidateController({
    required this.create,
    required this.edit,
    required this.delete,
    required this.getById,
    required this.getAll,
  });
}
