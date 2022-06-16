//ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:ventura_hr/shared/enums/result-type.enum.dart';
import 'package:ventura_hr/shared/extensions/string.extension.dart';
import 'package:ventura_hr/shared/helper/validationError.helper.dart';
import 'package:dio/dio.dart';

import 'result.helper.dart';

class ErrorResult<T> extends Result<T> {
  late final String code;
  final String message;
  final String? data;
  final List<String>? cookies;
  late final List<ValidationError> validationErrors;

  ErrorResult(
    ResultTypes status, {
    required String code,
    required this.message,
    this.cookies,
    this.data,
    List<ValidationError>? validationErrors,
  }) : super(status) {
    var codeCamelCase = code.pascalToCamelCase();
    this.code = codeCamelCase;
    this.validationErrors = validationErrors ?? [];
  }

  factory ErrorResult.fromErrorResponse(Response<dynamic>? response) {
    if (response == null || response.data == null) {
      log("erro desconhecido - causado por erro de rede ou erro sem body");
      return getDefaultError<T>();
    }
    log("status: " + response.statusCode.toString());
    log("uri: " + response.realUri.toString());

    Map<String, dynamic> jsonData;
    if (response.statusCode == 401) {
      return ErrorResult(response.statusCode.toResultType(),
          code: "Unauthorized", message: "A sessão do usuário expirou.");
    } else if (response.data is Map<String, dynamic>) {
      jsonData = response.data as Map<String, dynamic>;
    } else if (response.data is String && (response.data as String).isNotEmpty) {
      try {
        jsonData = json.decode(response.data as String) as Map<String, dynamic>;
      } on FormatException catch (_) {
        return getDefaultError<T>();
      }
    } else {
      log("erro desconhecido no parse do json");
      return getDefaultError<T>();
    }

    if (jsonData['error'] == null) {
      log("erro desconhecido: sem prop 'error' no body do erro");
      log("requisição possivelmente inválida");
      return getDefaultError<T>();
    }

    var cookies = response.headers["set-cookie"];
    log("cookies: " + cookies.toString());
    log("erro: " + jsonData['error']['code'].toString());

    var validationErrorsJson = jsonData['validationErrors'] as List<dynamic>?;
    List<ValidationError>? validationErrors;
    if (validationErrorsJson != null) {
      validationErrors = [];
      for (var valError in validationErrorsJson) {
        log("Propriedade: ${valError['property'] ?? ""} | Erro: ${valError['code']} | Mensagem: ${valError['message']}");
        validationErrors.add(ValidationError(
            property: valError['property'] as String? ?? "",
            code: valError['code'] as String,
            message: valError['message'] as String));
      }
    }

    return ErrorResult(response.statusCode.toResultType(),
        code: jsonData['error']['code'] as String,
        cookies: cookies,
        message: jsonData['error']['message'] as String,
        data: jsonData['error']['data'] as String?,
        validationErrors: validationErrors);
  }

  static ErrorResult<T> getDefaultError<T>() => ErrorResult<T>(ResultTypes.internalServerError,
      code: 'NetworkError', message: 'Erro desconhecido ao realizar a conexão.');

  static ErrorResult<T> getCancelTokenError<T>() =>
      ErrorResult<T>(ResultTypes.cancelledToken, code: 'Cancelled Token', message: 'Chamada cancelada');

  @override
  List<Object?> get props => super.props + [code, message, data, validationErrors];
}

extension ErrorResultExtension on String {
  T? toEnum<T extends Object>(List<T> values) {
    for (var val in values) {
      if (describeEnum(val).toLowerCase() == toLowerCase()) return val;
    }
    return null;
  }
}
