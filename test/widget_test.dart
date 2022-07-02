import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:ventura_hr/shared/endpoints/endpoint.config.dart';
import 'package:ventura_hr/shared/services/dio.service.dart';
import 'package:ventura_hr/signup/domain/entities/user.entity.dart';
import 'package:ventura_hr/signup/external/repositories/user.repository_impl.dart';

import 'repository.test.helper.dart';
import 'widget_test.mocks.dart';

@GenerateMocks([Response, DioService])
main() {
  late MockDioService dio;

  getInstance() {
    return UserRepositoryImpl(dio);
  }

  setUp(() {
    dio = MockDioService();
  });

  group("Create", () {
    User user = const User(
      accountType: 1,
      email: '',
      endereco: '',
      id: null,
      nome: '',
      status: null,
      telefone: '',
    );

    call() => getInstance().create(user: user);

    commonGetSuccessTest(
      'deve obter informações da localização do cep informado',
      getDio: () => dio,
      methodCall: call,
      expectedUrl: Endpoints.user.create.buildUrl(),
      responseMock: null,
      expectedResultData: null,
    );

    commonGetFailureTest(
      getDio: () => dio,
      methodCall: call,
    );
  });
}
