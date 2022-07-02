import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ventura_hr/shared/helper/error-result.helper.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

import 'generic.mock.dart';
import 'widget_test.mocks.dart';

commonPostSuccessTest<TResponseData, TResponse extends Response>(String testName,
    {required MockDioService Function() getDio,
    required Future<Result<TResponseData>> Function() methodCall,
    required String expectedUrl,
    required TResponse responseMock,
    required TResponseData expectedResultData,
    required dynamic expectedBody,
    List<String>? expectedCookies,
    String? expectedContentType}) {
  testWidgets(testName, (tester) async {
    var dio = getDio();
    when(dio.post(captureAny, captureAny,
            cookies: captureAnyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .thenAnswer((_) async => responseMock);

    var result = await methodCall();

    var arguments = verify(dio.post(captureAny, captureAny,
            cookies: captureAnyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .captured;
    expect(arguments[0], expectedUrl);
    expect(arguments[1], expectedBody);
    expect(listEquals(arguments[2] as List<String>?, expectedCookies), true);
    expect(arguments[3], expectedContentType);

    expect(result.getSuccessData(), expectedResultData);
  });
}

commonPostFailureTest<T, TResponse>({
  String testName = 'Deve falhar caso a requisição falhe',
  required MockDioService Function() getDio,
  required Future<Result<TResponse>> Function() methodCall,
}) {
  testWidgets(testName, (tester) async {
    var dio = getDio();
    var error = getGenericErrorMock();
    when(dio.post(captureAny, captureAny, cookies: anyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .thenThrow(error);

    var result = await methodCall();

    verify(dio.post(captureAny, captureAny, cookies: anyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .called(1);

    var defaultError = ErrorResult.getDefaultError<T>();

    expect(result.convertErrorResult().status, defaultError.status);
    expect(result.convertErrorResult().code, defaultError.code);
    expect(result.convertErrorResult().message, defaultError.message);
  });
}

commonGetSuccessTest<TResponseData, TResponse extends Response>(
  String testName, {
  required MockDioService Function() getDio,
  required Future<Result<TResponseData>> Function() methodCall,
  required String expectedUrl,
  required TResponse responseMock,
  required TResponseData expectedResultData,
  List<String>? expectedCookies,
}) {
  testWidgets(testName, (tester) async {
    var dio = getDio();
    when(dio.get(captureAny, cookies: captureAnyNamed('cookies'), cancelToken: captureAnyNamed('cancelToken')))
        .thenAnswer((_) async => responseMock);

    var result = await methodCall();

    var arguments =
        verify(dio.get(captureAny, cookies: captureAnyNamed('cookies'), cancelToken: captureAnyNamed('cancelToken')))
            .captured;
    expect(arguments[0], expectedUrl);
    expect(listEquals(arguments[1] as List<String>?, expectedCookies), true);

    expect(result.getSuccessData(), expectedResultData);
  });
}

commonGetFailureTest<T, TResponse>({
  String testName = 'Deve falhar caso a requisição falhe',
  required MockDioService Function() getDio,
  required Future<Result<TResponse>> Function() methodCall,
}) {
  testWidgets(testName, (tester) async {
    var dio = getDio();
    var error = getGenericErrorMock();
    when(dio.get(captureAny, cookies: captureAnyNamed('cookies'), cancelToken: captureAnyNamed('cancelToken')))
        .thenThrow(error);

    var result = await methodCall();

    verify(dio.get(captureAny, cookies: captureAnyNamed('cookies'), cancelToken: captureAnyNamed('cancelToken')))
        .called(1);

    var defaultError = ErrorResult.getDefaultError<T>();

    expect(result.convertErrorResult().status, defaultError.status);
    expect(result.convertErrorResult().code, defaultError.code);
    expect(result.convertErrorResult().message, defaultError.message);
  });
}

commonPutSuccessTest<TResponseData, TResponse extends Response>(String testName,
    {required MockDioService Function() getDio,
    required Future<Result<TResponseData>> Function() methodCall,
    required String expectedUrl,
    required TResponse responseMock,
    required TResponseData expectedResultData,
    required dynamic expectedBody,
    List<String>? expectedCookies,
    String? expectedContentType}) {
  testWidgets(testName, (tester) async {
    var dio = getDio();
    when(dio.put(captureAny, captureAny,
            cookies: captureAnyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .thenAnswer((_) async => responseMock);

    var result = await methodCall();

    var arguments = verify(dio.put(captureAny, captureAny,
            cookies: captureAnyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .captured;
    expect(arguments[0], expectedUrl);
    expect(arguments[1], expectedBody);
    expect(listEquals(arguments[2] as List<String>?, expectedCookies), true);
    expect(arguments[3], expectedContentType);

    expect(result.getSuccessData(), expectedResultData);
  });
}

commonPutFailureTest<T, TResponse>({
  String testName = 'Deve falhar caso a requisição falhe',
  required MockDioService Function() getDio,
  required Future<Result<TResponse>> Function() methodCall,
}) {
  testWidgets(testName, (tester) async {
    var dio = getDio();
    var error = getGenericErrorMock();
    when(dio.put(captureAny, captureAny, cookies: anyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .thenThrow(error);

    var result = await methodCall();

    verify(dio.put(captureAny, captureAny, cookies: anyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .called(1);

    var defaultError = ErrorResult.getDefaultError<T>();

    expect(result.convertErrorResult().status, defaultError.status);
    expect(result.convertErrorResult().code, defaultError.code);
    expect(result.convertErrorResult().message, defaultError.message);
  });
}

commonDeleteSuccessTest<TResponseData, TResponse extends Response>(String testName,
    {required MockDioService Function() getDio,
    required Future<Result<TResponseData>> Function() methodCall,
    required String expectedUrl,
    required TResponse responseMock,
    required TResponseData expectedResultData,
    List<String>? expectedCookies,
    String? expectedContentType}) {
  testWidgets(testName, (tester) async {
    var dio = getDio();
    when(dio.delete(captureAny, cookies: captureAnyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .thenAnswer((_) async => responseMock);

    var result = await methodCall();

    var arguments =
        verify(dio.delete(captureAny, cookies: captureAnyNamed('cookies'), contentType: captureAnyNamed('contentType')))
            .captured;
    expect(arguments[0], expectedUrl);
    expect(listEquals(arguments[1] as List<String>?, expectedCookies), true);

    expect(result.getSuccessData(), expectedResultData);
  });
}

commonDeleteFailureTest<T, TResponse>({
  String testName = 'Deve falhar caso a requisição falhe',
  required MockDioService Function() getDio,
  required Future<Result<TResponse>> Function() methodCall,
}) {
  testWidgets(testName, (tester) async {
    var dio = getDio();
    var error = getGenericErrorMock();
    when(dio.delete(captureAny, cookies: anyNamed('cookies'), contentType: captureAnyNamed('contentType')))
        .thenThrow(error);

    var result = await methodCall();

    verify(dio.delete(captureAny, cookies: anyNamed('cookies'), contentType: captureAnyNamed('contentType'))).called(1);

    var defaultError = ErrorResult.getDefaultError<T>();

    expect(result.convertErrorResult().status, defaultError.status);
    expect(result.convertErrorResult().code, defaultError.code);
    expect(result.convertErrorResult().message, defaultError.message);
  });
}
