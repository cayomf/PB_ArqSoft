import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/login-firebase/domain/errors/errors.dart';
import 'package:ventura_hr/login-firebase/infra/models/user_model.dart';
import '../../infra/datasources/login_datasource.dart';

part 'firebase_datasource.g.dart';

@Injectable(singleton: false)
class FirebaseDataSourceImpl implements LoginDataSource {
  final FirebaseAuth auth;

  FirebaseDataSourceImpl(this.auth);

  @override
  Future<UserModel> loginEmail({String email = '', String password = ''}) async {
    var user;
    await auth.signInWithEmailAndPassword(email: email, password: password).then((result) {
      user = result.user;
    });
    print(user.toString());
    return UserModel(
      name: user.displayName != null ? user.displayName : '',
      phoneNumber: user.phoneNumber != null ? user.phoneNumber : '',
      email: user.cargo,
      uid: user.uid,
    );
  }

  @override
  Future<UserModel> loginPhone({String? phone}) async {
    var completer = Completer<AuthCredential>();
    await auth.verifyPhoneNumber(
        phoneNumber: phone!,
        timeout: Duration(seconds: 30),
        verificationCompleted: (auth) {
          completer.complete(auth);
        },
        verificationFailed: (e) {
          completer.completeError(e);
        },
        codeSent: (String? c, [int? i]) {
          completer.completeError(NotAutomaticRetrieved(c!));
        },
        codeAutoRetrievalTimeout: (v) {});

    var credential = await completer.future;
    var user = (await auth.signInWithCredential(credential)).user;
    return UserModel(
      name: user!.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<UserModel> validateCode({String? verificationId, String? code}) async {
    var _credential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: code!);
    var user = (await auth.signInWithCredential(_credential)).user;
    return UserModel(
      name: user!.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  register({String? email, String? password}) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(email: email!, password: password!);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<UserModel> currentUser() async {
    var user = auth.currentUser;

    if (user == null) throw ErrorGetLoggedUser();

    return UserModel(
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<void> logout() async {
    return await auth.signOut();
  }
}
