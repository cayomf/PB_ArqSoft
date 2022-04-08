import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  final String? id;
  final String? email;
  final String? name;
  final String? phoneNumber;

  const LoggedUser({this.id, this.email, this.name, this.phoneNumber});

  @override
  List<Object> get props => [id!, email!, name!, phoneNumber!];
}
