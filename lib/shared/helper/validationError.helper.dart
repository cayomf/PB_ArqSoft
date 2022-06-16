import 'package:equatable/equatable.dart';
import 'package:ventura_hr/shared/extensions/string.extension.dart';

class ValidationError extends Equatable {
  late final String property;
  late final String code;
  final String message;

  ValidationError({
    required String property,
    required String code,
    required this.message,
  }) {
    this.property = property.pascalToCamelCase();
    this.code = code.pascalToCamelCase();
  }

  @override
  List<Object?> get props => [property, code, message];
}
