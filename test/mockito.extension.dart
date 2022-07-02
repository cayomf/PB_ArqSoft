import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:ventura_hr/shared/helper/error-result.helper.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';

extension DataFuturePostExpectationsExtension<TFunc> on PostExpectation<Future<TFunc>> {
  /// Store a canned Future response for this method stub.
  ///
  /// Note: [expected] must be a Future or Stream.
  /// To return a non-Future from a method stub, use [thenReturn].
  void thenReturnAsync(TFunc expected) {
    thenAnswer((realInvocation) async => expected);
  }

  /// Store a canned Future response for this method stub.
  void thenUseCompleter(Completer<TFunc> completer) {
    thenAnswer((realInvocation) => completer.future);
  }
}

extension ResultFuturePostExpectationsExtension<TFunc> on PostExpectation<Future<Result<TFunc>>> {
  void thenReturnSuccess(TFunc expected) {
    thenAnswer((realInvocation) async => SuccessResult(expected));
  }

  void thenReturnGenericError() {
    thenAnswer((realInvocation) async => ErrorResult.getDefaultError());
  }
}

extension FuturePostExpectationsExtension<TFunc> on PostExpectation<Future> {
  /// This method will not work unless the expected return is a Future.
  void thenDoNothingAsync() {
    thenAnswer((realInvocation) async => {});
  }
}

extension PostExpectationsExtension<TFunc> on PostExpectation<void> {
  /// This method will not work unless the expected return is void.
  void thenDoNothing() {
    thenAnswer((realInvocation) => {});
  }
}
