import 'package:ventura_hr/shared/endpoints/endpoint.dart';

class UserController {
  final Endpoint create;
  final Endpoint edit;
  final Endpoint delete;
  final Endpoint getById;
  final Endpoint getAll;

  const UserController({
    required this.create,
    required this.edit,
    required this.delete,
    required this.getById,
    required this.getAll,
  });
}
