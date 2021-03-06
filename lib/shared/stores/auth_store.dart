import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:ventura_hr/area-logada/domain/entities/vacancy.entity.dart';
import 'package:ventura_hr/login-firebase/domain/entities/logged_user_info.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/get_logged_user.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/logout.dart';
import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

part 'auth_store.g.dart';

@Injectable()
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final GetLoggedUser getLoggedUser;
  final Logout logout;
  _AuthStoreBase(this.getLoggedUser, this.logout);

  @observable
  LoggedUserInfo? user;

  @computed
  bool get isLogged => user != null;

  @observable
  User? userData;

  @observable
  List<Vacancy> listaVagas = [];

  @action
  void setUser(LoggedUserInfo? value) => user = value;

  Future<bool?> checkLogin() async {
    var result = await getLoggedUser();
    return result.fold((l) => null, (user) {
      setUser(user);
      return true;
    });
  }

  Future signOut() async {
    var result = await logout();
    result.fold((l) {
      asuka.showSnackBar(SnackBar(content: Text(l.message!)));
    }, (r) {
      setUser(null);
    });
  }
}
