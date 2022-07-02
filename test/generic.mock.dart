import 'dart:convert';

import '../utils.dart';
import '../utils.mocks.dart';

final emptyJson = json.decode("""{}""") as Map<String, dynamic>;

const emptyStringJson = "{}";

final genericErrorJson = emptyJson;

/// Do not call this inside thenThrow. Call it outside, then pass the result to the function.
MockDioError getGenericErrorMock() => genericErrorJson.makeError();

final validationError = json.decode("""
{
    "status": 422,
    "type": "UNPROCESSABLE_ENTITY",
    "detail": "Omg! There is something wrong here.",
    "error": {
        "code": "ValidationError",
        "message": "Erro na validação da requisição."
    },
    "validationErrors": [
        {
            "property": "PasswordConfirmation",
            "code": "NeedsSixNumbers",
            "message": "A senha precisa ser composta de 6 números."
        },
        {
            "property": "",
            "code": "PasswordsMustMatch",
            "message": "As senhas precisam ser iguais."
        }
    ]
}
""") as Map<String, dynamic>;

final requestHeaders = {
  """
{
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Set-Cookie': ['test']
    }
"""
} as Map<String, dynamic>;

/// Do not call this inside thenThrow. Call it outside, then pass the result to the function.
MockDioError getValidationErrorMock() => validationError.makeError();

final commonError = json.decode("""
{
    "status": 503,
    "type": "SERVICE_UNAVAILABLE",
    "detail": "ServiceUnavailable",
    "error": {
        "code": "ProfileServiceUnavailable",
        "message": "O perfil do usuário não pode ser obtido no momento."
    },
    "validationErrors": []
}
""") as Map<String, dynamic>;

/// Do not call this inside thenThrow. Call it outside, then pass the result to the function.
MockDioError getCommonErrorMock() => commonError.makeError();

final errorWithData = json.decode("""
{
    "status": 422,
    "type": "UNPROCESSABLE_ENTITY",
    "detail": "Omg! There is something wrong here.",
    "error": {
        "code": "TemporarilyBlocked",
        "message": "Temporariamente bloqueado. Timestamp de quando é possível logar em ErrorData.",
        "data": "2021-10-22T18:52:05.9684433+00:00"
    },
    "validationErrors": []
}
""") as Map<String, dynamic>;

MockDioError getErrorWithDataMock() => errorWithData.makeError();
