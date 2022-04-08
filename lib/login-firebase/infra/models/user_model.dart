import 'package:meta/meta.dart';
import 'package:ventura_hr/login-firebase/domain/entities/logged_user.dart';
import 'package:ventura_hr/login-firebase/domain/entities/logged_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({@required String? uid, @required String? name, String? email, String? phoneNumber})
      : super(id: uid!, name: name!, email: email!, phoneNumber: phoneNumber!);

  LoggedUser toLoggedUser() => this;
}
